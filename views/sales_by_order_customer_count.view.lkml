view: sales_by_order_customer_count {
  derived_table: {
    sql: select invoice_month,fiscal_month_name_fy,brand_name,new_customers_brand,new_customers_all,total_customers_brand,
sum(total_customers_brand) over (partition by invoice_month order by 1) as total_customers_all
from
(SELECT invoice_month,fiscal_month_name_fy,brand_name,new_customers as new_customers_brand,
       SUM(new_customers) OVER (PARTITION BY brand_name ORDER BY invoice_month,brand_name) AS total_customers_brand,
       SUM(new_customers) OVER (PARTITION BY invoice_month ORDER BY 1) AS new_customers_all
FROM (SELECT TO_CHAR(date_trunc ('MONTH',INVOICE_date),'YYYY-MM') AS invoice_month,
             fiscal_month_name_fy,
             brand_name_1 as brand_name,
             COUNT(DISTINCT customer_id_1) AS new_customers
      FROM (SELECT RANK() OVER (PARTITION BY customer_id ORDER BY TO_CHAR (date_trunc ('MONTH',INVOICE_date),'YYYY-MM'),BRAND_NAME) AS seq_num,
                   a.customer_id AS customer_id_1,
                   TO_CHAR(date_trunc ('MONTH',INVOICE_date),'YYYY-MM'),
                   BRAND_NAME as brand_name_1,
                   a.*
            FROM "ANALYTICS_DATABASE"."SALES"."SALES_BY_ORDER" a
            WHERE a."CUSTOMER_TYPE" = 'Direct Consumer'
            ORDER BY a.customer_id,
                     TO_CHAR(date_trunc ('MONTH',INVOICE_date),'YYYY-MM'),
                     BRAND_NAME_1)
      WHERE seq_num = 1
      GROUP BY 1,2,3
      ORDER BY 1,2,3)
ORDER BY 1,2,3)
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


  dimension: new_customers_brand {
    type: number
    sql: ${TABLE}."NEW_CUSTOMERS_BRAND" ;;
  }

  dimension: new_customers_all {
    type: number
    sql: ${TABLE}."NEW_CUSTOMERS_ALL" ;;
  }

  dimension: total_customers_brand {
    type: number
    sql: ${TABLE}."TOTAL_CUSTOMERS_BRAND" ;;
  }
  dimension: total_customers_all {
    type: number
    sql: ${TABLE}."TOTAL_CUSTOMERS_ALL" ;;
  }
  set: detail {
    fields: [invoice_month, fiscal_month_name_fy, new_customers_brand, new_customers_all, total_customers_brand, total_customers_all]
  }
}
