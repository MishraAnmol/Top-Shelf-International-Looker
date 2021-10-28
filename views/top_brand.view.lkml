view: top_brand {
  derived_table: {
  sql:
     select CASE WHEN customer_type = 'Direct Consumer'
              THEN CASE WHEN brand_name = 'Grainshaker' THEN 'Grainshaker Customer'
                        WHEN brand_name = 'NED' THEN 'NED Customer'
                        ELSE '-NA-'
                   END
              ELSE customer_title
         END as customer_title, rank() over (order by sum(SALES_AMOUNT_AUD) desc) rank_amount
    from "ANALYTICS_DATABASE"."SALES"."SALES_BY_ORDER" group by CASE WHEN customer_type = 'Direct Consumer'
              THEN CASE WHEN brand_name = 'Grainshaker' THEN 'Grainshaker Customer'
                        WHEN brand_name = 'NED' THEN 'NED Customer'
                        ELSE '-NA-'
                   END
              ELSE customer_title
         END ;;
  }


  dimension: customer_title {
    type: string
    sql: ${TABLE}.CUSTOMER_TITLE ;;
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
