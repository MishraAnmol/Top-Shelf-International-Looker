view: top_product_brand_wise {
  derived_table: {
    sql: select brand_name,product_title,net_sales_amount as net_sales_amt,product_rank from
      (select brand_name,product_title,net_sales_amount, rank() over (partition by brand_name order by net_sales_amount desc)  as product_rank from
      (select brand_name,product_title,sum(NET_SALES_AMOUNT_AUD) as net_sales_amount
      from "ANALYTICS_DATABASE"."SALES"."SALES_BY_ORDER" a
      WHERE a."CUSTOMER_TYPE" = 'Direct Consumer'
      group by 1,2
      order by 1,2))
      where product_rank <= 5 order by brand_name,product_rank
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}."BRAND_NAME" ;;
  }

  dimension: product_title {
    type: string
    sql: ${TABLE}."PRODUCT_TITLE" ;;
    primary_key: yes
  }

  dimension: net_sales_amt {
    type: number
    sql: ${TABLE}."NET_SALES_AMT" ;;
  }

  dimension: product_rank {
    type: number
    sql: ${TABLE}."PRODUCT_RANK" ;;
  }

  measure: net_sales_amount  {
    type: sum
    sql: ${net_sales_amt} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [brand_name, product_title, net_sales_amount, product_rank]
  }
}
