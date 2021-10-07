view: promo_expenses {
  sql_table_name: "SALES"."PROMO_EXPENSES"
    ;;

  dimension: account_code {
    type: string
    sql: ${TABLE}."ACCOUNT_CODE" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: fiscal_month_name_fy {
    type: string
    sql: ${TABLE}."FISCAL_MONTH_NAME_FY" ;;
    primary_key: yes
  }

  dimension: fiscal_quarter {
    type: string
    sql: ${TABLE}."FISCAL_QUARTER" ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: gross_amount {
    type: number
    sql: ${TABLE}."GROSS_AMOUNT" ;;
  }

  dimension_group: journal {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."JOURNAL_DATE" ;;
  }

  dimension: journal_number {
    type: number
    sql: ${TABLE}."JOURNAL_NUMBER" ;;
  }

  dimension_group: load_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LOAD_TIMESTAMP" ;;
  }

  dimension: modified_account_name {
    type: string
    sql: ${TABLE}."MODIFIED_ACCOUNT_NAME" ;;
  }

  dimension: net_amount {
    type: number
    sql: ${TABLE}."NET_AMOUNT" ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}."SOURCE_TYPE" ;;
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}."TAX_AMOUNT" ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name, modified_account_name]
  }

  measure: stock_overheads  {
    type: sum
    sql: CASE WHEN ${modified_account_name} in ('Promotional Expenses - ALM Bonus Stock', 'Promotional Expenses - Sales Team Stock Allowance')
              THEN ${net_amount}
              ELSE 0
          END;;
    drill_fields: [account_name, account_code, modified_account_name, description, fiscal_month_name_fy, net_amount, stock_overheads, promo_overheads]
  }

  measure: promo_overheads  {
    type: sum
    sql: CASE WHEN ${modified_account_name} in ('Promotional and Artwork Expenses', 'Sales and Marketing - Activation', 'Sales and Marketing - Agencies', 'Sales and Marketing - Brand', 'Sales and Marketing - Design', 'Sales and Marketing')
              THEN ${net_amount}
              ELSE 0
          END;;
    drill_fields: [account_name, account_code, modified_account_name, description, fiscal_month_name_fy, net_amount, stock_overheads, promo_overheads]
  }

}
