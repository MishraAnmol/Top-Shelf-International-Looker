view: sales_by_order_prev_3months {
  derived_table: {
    sql: select invoice_month,fiscal_month_name_fy,brand_name,net_sales_amount,
    lag(net_sales_amount,-1) over (partition by brand_name order by invoice_month desc)
    as last_month_sales_amount,
      (lag(net_sales_amount,-1) over (partition by brand_name order by invoice_month desc) +
      lag(net_sales_amount,-2) over (partition by brand_name order by invoice_month desc) +
      lag(net_sales_amount,-3) over (partition by brand_name order by invoice_month desc))/3 as last_3_month_avg
      from
      (SELECT
        TO_CHAR(DATE_TRUNC('month', sales_by_order."INVOICE_DATE" ), 'YYYY-MM') AS invoice_month,
        sales_by_order."FISCAL_MONTH_NAME_FY"  AS fiscal_month_name_fy,
        sales_by_order."BRAND_NAME" as brand_name,
        COALESCE(SUM((sales_by_order."NET_SALES_AMOUNT_AUD") ), 0) AS net_sales_amount

      FROM "ANALYTICS_DATABASE"."SALES"."SALES_BY_ORDER"
           AS sales_by_order

      WHERE (((sales_by_order."CUSTOMER_TYPE") = 'Direct Consumer')) AND
      ((sales_by_order."BRAND_NAME") = 'NED' OR (sales_by_order."BRAND_NAME") = 'Grainshaker' OR
       (sales_by_order."BRAND_NAME") = '3rd Party' OR (sales_by_order."ITEM_CODE") = 'Rebate')
      GROUP BY DATE_TRUNC('month', sales_by_order."INVOICE_DATE" ),2,3
      ORDER BY 1 DESC,3
      LIMIT 500 ) order by 1 desc,3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: invoice_month {
    type: string
    sql: ${TABLE}."INVOICE_MONTH" ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}."BRAND_NAME" ;;
  }


  dimension: fiscal_month_name_fy {
    type: string
    sql: ${TABLE}."FISCAL_MONTH_NAME_FY" ;;
  }

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.FISCAL_MONTH_NAME_FY, ' ', ${TABLE}.BRAND_NAME) ;;
  }
  dimension: net_sales_amount {
    type: number
    sql: ${TABLE}."NET_SALES_AMOUNT" ;;
  }

  dimension: last_month_sales_amount {
    type: number
    sql: ${TABLE}."LAST_MONTH_SALES_AMOUNT" ;;
  }


  dimension: last_3_month_avg {
    type: number
    sql: ${TABLE}."LAST_3_MONTH_AVG" ;;
  }


  measure: net_sales_amount_prev_3_months_avg_change  {
    type: sum
    sql:100*(( ${TABLE}."NET_SALES_AMOUNT"/(${TABLE}."LAST_3_MONTH_AVG")) -1)   ;;
    value_format: "0\%"
    html:
    {% if value > 0 %}
    {% assign indicator = "green,▲" | split: ',' %}
    {% elsif value < 0 %}
    {% assign indicator = "red,▼" | split: ',' %}
    {% else %}
    {% assign indicator = "black,▬" | split: ',' %}
    {% endif %}
    <font color="{{indicator[0]}}">
    {% if value == 99999.12345 %} &infin
    {% else %}{{rendered_value}}
    {% endif %} {{indicator[1]}}
    </font> ;;
    drill_fields: [detail*]
  }


  measure: net_sales_amount_prev_month_change  {
    type: sum
    sql:100*(( ${TABLE}."NET_SALES_AMOUNT"/(${TABLE}."LAST_MONTH_SALES_AMOUNT")) -1)   ;;
    value_format: "0\%"
    html:
    {% if value > 0 %}
    {% assign indicator = "green,▲" | split: ',' %}
    {% elsif value < 0 %}
    {% assign indicator = "red,▼" | split: ',' %}
    {% else %}
    {% assign indicator = "black,▬" | split: ',' %}
    {% endif %}
    <font color="{{indicator[0]}}">
    {% if value == 99999.12345 %} &infin
    {% else %}{{rendered_value}}
    {% endif %} {{indicator[1]}}
    </font> ;;
    drill_fields: [detail*]
  }





  set: detail {
    fields: [invoice_month, fiscal_month_name_fy, net_sales_amount, last_month_sales_amount,last_3_month_avg,]
  }
}
