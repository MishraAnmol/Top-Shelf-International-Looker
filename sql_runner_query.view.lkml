view: sql_runner_query {
  derived_table: {
    sql: select x.fiscal_month_name_fy, GROSS_SALES_AMOUNT_AUD, NET_SALES_AMOUNT_AUD,
      C1_MARGIN_AUD, C2_MARGIN_AUD,
      (C2_MARGIN_AUD - stock_overheads) C3_MARGIN_AUD,
      (C2_MARGIN_AUD - stock_overheads - promo_overheads) C4_MARGIN_AUD from
            (
            SELECT
              fiscal_month_name_fy,
                COALESCE(SUM(( "GROSS_SALES_AMOUNT_AUD"  ) ), 0) GROSS_SALES_AMOUNT_AUD,
              COALESCE(SUM(( "NET_SALES_AMOUNT_AUD"  ) ), 0) NET_SALES_AMOUNT_AUD,
                COALESCE(SUM(( "C1_MARGIN_AUD"  ) ), 0) AS C1_MARGIN_AUD,
                COALESCE(SUM(( "C2_MARGIN_AUD"  ) ), 0) AS C2_MARGIN_AUD
            FROM SALES.SALES_BY_ORDER
            group by fiscal_month_name_fy)y
            left outer join
            (
            SELECT fiscal_month_name_fy,
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
            group by fiscal_month_name_fy) x on x.fiscal_month_name_fy=y.fiscal_month_name_fy
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fiscal_month_name_fy {
    type: string
    sql: ${TABLE}."FISCAL_MONTH_NAME_FY" ;;
  }

  dimension: gross_sales_amount_aud {
    type: number
    sql: ${TABLE}."GROSS_SALES_AMOUNT_AUD" ;;
  }

  dimension: net_sales_amount_aud {
    type: number
    sql: ${TABLE}."NET_SALES_AMOUNT_AUD" ;;
  }

  dimension: c1_margin_aud {
    type: number
    sql: ${TABLE}."C1_MARGIN_AUD" ;;
  }

  dimension: c2_margin_aud {
    type: number
    sql: ${TABLE}."C2_MARGIN_AUD" ;;
  }

  dimension: c3_margin_aud {
    type: number
    sql: ${TABLE}."C3_MARGIN_AUD" ;;
  }

  dimension: c4_margin_aud {
    type: number
    sql: ${TABLE}."C4_MARGIN_AUD" ;;
  }

  set: detail {
    fields: [
      fiscal_month_name_fy,
      gross_sales_amount_aud,
      net_sales_amount_aud,
      c1_margin_aud,
      c2_margin_aud,
      c3_margin_aud,
      c4_margin_aud
    ]
  }
}
