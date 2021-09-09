view: sales_by_customer {
  sql_table_name: "SALES"."SALES_BY_CUSTOMER"
    ;;

  dimension: accepts_marketing {
    type: yesno
    sql: ${TABLE}."ACCEPTS_MARKETING" ;;
  }

  dimension: address_line_1 {
    type: string
    sql: ${TABLE}."ADDRESS_LINE_1" ;;
  }

  dimension: address_line_2 {
    type: string
    sql: ${TABLE}."ADDRESS_LINE_2" ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}."BRAND_NAME" ;;
  }

  dimension: brand_type {
    type: string
    sql: ${TABLE}."BRAND_TYPE" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}."COUNTRY_CODE" ;;
  }

  dimension: credit_line_amount_aud {
    type: number
    sql: ${TABLE}."CREDIT_LINE_AMOUNT" ;;
  }

  dimension: credit_line_quantity {
    type: number
    sql: ${TABLE}."CREDIT_LINE_QUANTITY" ;;
  }

  dimension: customer_code {
    type: string
    sql: ${TABLE}."CUSTOMER_CODE" ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: customer_title {
    type: string
    sql: ${TABLE}."CUSTOMER_TITLE" ;;
  }

  dimension: customer_channel {
    type: string
    sql: ${TABLE}."CUSTOMER_TYPE" ;;
  }

  dimension_group: date_registered {
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
    sql: ${TABLE}."DATE_REGISTERED" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: fiscal_quarter {
    type: string
    sql: ${TABLE}."FISCAL_QUARTER" ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension_group: invoice {
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
    sql: ${TABLE}."INVOICE_DATE" ;;
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}."ITEM_CODE" ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}."ITEM_ID" ;;
  }

  dimension: item_title {
    type: string
    sql: ${TABLE}."ITEM_TITLE" ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}."ITEM_TYPE" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: liq_license_num {
    type: string
    sql: ${TABLE}."LIQ_LICENSE_NUM" ;;
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

  dimension: multipass_identifier {
    type: string
    sql: ${TABLE}."MULTIPASS_IDENTIFIER" ;;
  }

  dimension: operating_cost_amount_aud {
    type: number
    sql: ${TABLE}."OPERATING_COST_AMOUNT_AUD" ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."PHONE" ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}."PRODUCT_CODE" ;;
  }

  dimension: product_group {
    type: string
    sql: ${TABLE}."PRODUCT_GROUP" ;;
  }

  dimension: product_group_code {
    type: string
    sql: ${TABLE}."PRODUCT_GROUP_CODE" ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: product_title {
    type: string
    sql: ${TABLE}."PRODUCT_TITLE" ;;
  }

  dimension: province_code {
    type: string
    sql: ${TABLE}."PROVINCE_CODE" ;;
  }

  dimension: sales_amount_aud {
    type: number
    sql: ${TABLE}."SALES_AMOUNT_AUD" ;;
  }

  dimension: sales_quantity {
    type: number
    sql: ${TABLE}."SALES_QUANTITY" ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}."SIZE" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: tax_exempt {
    type: yesno
    sql: ${TABLE}."TAX_EXEMPT" ;;
  }

  dimension: total_cost_amount_aud {
    type: number
    sql: ${TABLE}."TOTAL_COST_AMOUNT_AUD" ;;
  }

  dimension: unit_type {
    type: string
    sql: ${TABLE}."UNIT_TYPE" ;;
  }

  dimension: units {
    type: number
    sql: ${TABLE}."UNITS" ;;
  }

  dimension: vessel {
    type: string
    sql: ${TABLE}."VESSEL" ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}."ZIP" ;;
  }

  measure: count {
    type: count
    drill_fields: [brand_name, first_name, last_name]
  }

  measure: total_sales_amount  {
    type: sum
    sql: ${sales_amount_aud} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [customer_title, customer_channel, product_title, brand_type, brand_name, sales_amount_aud]
  }

  measure: total_sales_quantity  {
    type: sum
    sql: ${sales_quantity} ;;
    drill_fields: [customer_title, customer_channel, product_title, brand_type, brand_name, sales_quantity]
  }

  measure: total_cost_amount  {
    type: sum
    sql: ${total_cost_amount_aud} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [ customer_title, customer_channel, product_title, brand_type, brand_name, total_cost_amount_aud]
  }

  measure: total_cost_amount_wo_excise  {
    type: sum
    sql: ${operating_cost_amount_aud} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [ customer_title, customer_channel, product_title, brand_type, brand_name, operating_cost_amount_aud]
  }

  measure: total_credit_amount  {
    type: sum
    sql: ${credit_line_amount_aud} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [ customer_title, customer_channel, product_title, brand_type, brand_name, credit_line_amount_aud]
  }

  measure: total_credit_quantity  {
    type: sum
    sql: ${credit_line_quantity} ;;
    drill_fields: [ customer_title, customer_channel, product_title, brand_type, brand_name, operating_cost_amount_aud]
  }

  measure: gross_margin  {
    sql: ((${total_sales_amount}+${total_credit_amount})-${total_cost_amount})*100/(${total_sales_amount}+${total_credit_amount}) ;;
    value_format: "0.00\%"
    drill_fields: [customer_title, customer_channel, product_id, product_title, brand_type, brand_name,  total_sales_amount, total_credit_amount, total_cost_amount, total_cost_amount_wo_excise ]
  }

  measure: gross_margin_wo_excise  {
    sql: CASE WHEN ${customer_channel}='Direct 3rd Party' THEN NULL
              ELSE ((${total_sales_amount}+${total_credit_amount})-${total_cost_amount_wo_excise})*100/(${total_sales_amount}+${total_credit_amount})
              END;;
    value_format: "0.00\%"
    drill_fields: [customer_title, customer_channel, product_id, product_title, brand_type, brand_name, total_sales_amount, total_credit_amount, total_cost_amount, total_cost_amount_wo_excise  ]
  }

}
