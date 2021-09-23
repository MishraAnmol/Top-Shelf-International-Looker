view: top_brand {
  derived_table: {
  sql:
    select customer_title, rank() over (order by sum(SALES_AMOUNT_AUD) desc) rank_amount
    from "ANALYTICS_DATABASE"."SALES"."SALES_BY_ORDER" group by customer_title
     ;;
  }


  dimension: customer_title {
    type: string
    sql: ${TABLE}.customer_title ;;
    primary_key: yes
  }

  dimension: rank_raw {
    type: number
    sql: ${TABLE}.rank_amount ;;
  }

  dimension: top_20 {
    type: yesno
    sql: ${TABLE}.rank_amount <= 20 ;;
  }

  dimension: top_20_customers {
    type: yesno
    sql: CASE WHEN ${top_20} = 'Yes' then ${customer_title} else 'Other' end;;
  }
}
