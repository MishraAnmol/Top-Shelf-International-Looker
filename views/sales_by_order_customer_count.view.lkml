view: sales_by_order_customer_count {
  derived_table: {
    sql: select invoice_month,fiscal_month_name_fy,new_customers,sum(new_customers) over (partition by 1 order by invoice_month) as total_customers from
      (
      select TO_CHAR(date_trunc('MONTH',INVOICE_date),'YYYY-MM') as invoice_month,fiscal_month_name_fy,count(distinct customer_id_1) as new_customers from
      (select rank() over (partition by customer_id order by TO_CHAR(date_trunc('MONTH',INVOICE_date),'YYYY-MM')) as seq_num,
      a.customer_id as customer_id_1,TO_CHAR(date_trunc('MONTH',INVOICE_date),'YYYY-MM'),a.*
      from "ANALYTICS_DATABASE"."SALES"."SALES_BY_ORDER" a
      WHERE a."CUSTOMER_TYPE" = 'Direct Consumer'
      order by a.customer_id,TO_CHAR(date_trunc('MONTH',INVOICE_date),'YYYY-MM'))
      where seq_num=1
      group by 1,2 order by 1,2
      )
      order by 1,2
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

  dimension: fiscal_month_name_fy {
    type: string
    sql: ${TABLE}."FISCAL_MONTH_NAME_FY" ;;
    primary_key: yes
  }

  dimension: new_customers {
    type: number
    sql: ${TABLE}."NEW_CUSTOMERS" ;;
  }

  dimension: total_customers {
    type: number
    sql: ${TABLE}."TOTAL_CUSTOMERS" ;;
  }

  set: detail {
    fields: [invoice_month, fiscal_month_name_fy, new_customers, total_customers]
  }
}
