view: contribution_margins {
  derived_table: {
    sql: select fiscal_month_name_fy, stock_overheads, promo_overheads from
            (   SELECT fiscal_month_name_fy,
                COALESCE(SUM(CASE
                      WHEN ( "MODIFIED_ACCOUNT_NAME"  ) in ('Promotional and Artwork Expenses', 'Sales and Marketing - Activation', 'Sales and Marketing - Agencies', 'Sales and Marketing - Brand', 'Sales and Marketing - Design', 'Sales and Marketing')
                      THEN ( "NET_AMOUNT"  )

                      ELSE 0
                    END), 0) AS promo_overheads,
                COALESCE(SUM(CASE
                      WHEN ( "MODIFIED_ACCOUNT_NAME"  ) in ('Promotional Expenses - ALM Bonus Stock', 'Promotional Expenses - Sales Team Stock Allowance')
                      THEN ( "NET_AMOUNT"  )
                      ELSE 0
                    END), 0) AS stock_overheads
            FROM
            SALES.PROMO_EXPENSES
            group by fiscal_month_name_fy)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fiscal_month_name_fy {
    type: string
    sql: ${TABLE}."FISCAL_MONTH_NAME_FY" ;;
    primary_key: yes
  }

  dimension: stock_overheads {
    type: number
    sql: ${TABLE}."STOCK_OVERHEADS" ;;
  }

  dimension: promo_overheads {
    type: number
    sql: ${TABLE}."PROMO_OVERHEADS" ;;
  }

  measure: stock_overheads_val {
    type: min
    sql: ${TABLE}."STOCK_OVERHEADS" ;;
    drill_fields: [fiscal_month_name_fy]
  }

  measure: promo_overheads_val {
    type: min
    sql: ${TABLE}."PROMO_OVERHEADS" ;;
    drill_fields: [fiscal_month_name_fy]
  }

  measure: net_sales_amount  {
    type: number
    sql: ${sales_by_order.net_sales_amount};;
  }

  measure: c2_margin  {
    type: number
    sql: ${sales_by_order.c2_margin};;
      }

    measure: c3_margin  {
    type:  number
    sql: ${c2_margin} - ${stock_overheads_val};;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [detail*]
  }

  measure: c4_margin  {
    type:  number
    sql: ${c2_margin} - ${stock_overheads_val} - ${promo_overheads_val};;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [detail*]
  }

  measure: c3_margin_perc  {
    sql: ${c3_margin}*100/${net_sales_amount} ;;
    value_format: "0.00\%"
    drill_fields: [detail*]
  }

  measure: c4_margin_perc  {
    sql: ${c4_margin}*100/${net_sales_amount} ;;
    value_format: "0.00\%"
    drill_fields: [detail*]
  }



  set: detail {
    fields: [
      fiscal_month_name_fy,
      stock_overheads,
      promo_overheads
    ]
  }
}
