view: alm_sales_by_order {
  sql_table_name: "SALES"."ALM_SALES_BY_ORDER"
    ;;

  dimension: adjust_number {
    type: number
    sql: ${TABLE}."ADJUST_NUMBER" ;;
  }

  dimension: base_price {
    type: number
    sql: ${TABLE}."BASE_PRICE" ;;
  }

  dimension: branch_number {
    type: number
    sql: ${TABLE}."BRANCH_NUMBER" ;;
  }

  dimension: commodity_description {
    type: string
    sql: ${TABLE}."COMMODITY_DESCRIPTION" ;;
  }

  dimension: duty_free {
    type: string
    sql: ${TABLE}."DUTY_FREE" ;;
  }

  dimension: fiscal_quarter {
    type: string
    sql: ${TABLE}."FISCAL_QUARTER" ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: fiscal_year_month {
    type: string
    sql: ${TABLE}."FISCAL_YEAR_MONTH" ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}."GROUP_NAME" ;;
  }

  dimension: gst_value {
    type: number
    sql: ${TABLE}."GST_VALUE" ;;
  }

  dimension: invoice_number {
    type: number
    sql: ${TABLE}."INVOICE_NUMBER" ;;
  }

  dimension: license_type {
    type: string
    sql: ${TABLE}."LICENSE_TYPE" ;;
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

  dimension: on_premise {
    type: string
    sql: ${TABLE}."ON_PREMISE" ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}."ORDER_NUMBER" ;;
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}."ORDER_TYPE" ;;
  }

  dimension: otd_liquor_file_desc {
    type: string
    sql: ${TABLE}."OTD_LIQUOR_FILE_DESC" ;;
  }

  dimension: outlet_address {
    type: string
    sql: ${TABLE}."OUTLET_ADDRESS" ;;
  }

  dimension: outlet_id {
    type: number
    sql: ${TABLE}."OUTLET_ID" ;;
  }

  dimension: outlet_license_no {
    type: string
    sql: ${TABLE}."OUTLET_LICENSE_NO" ;;
  }

  dimension: outlet_name {
    type: string
    sql: ${TABLE}."OUTLET_NAME" ;;
  }

  dimension: outlet_postcode {
    type: number
    sql: ${TABLE}."OUTLET_POSTCODE" ;;
  }

  dimension: outlet_state {
    type: string
    sql: ${TABLE}."OUTLET_STATE" ;;
  }

  dimension: outlet_suburb {
    type: string
    sql: ${TABLE}."OUTLET_SUBURB" ;;
  }

  dimension: phone {
    type: number
    sql: ${TABLE}."PHONE" ;;
  }

  dimension: product_apn {
    type: string
    sql: ${TABLE}."PRODUCT_APN" ;;
  }

  dimension: product_code {
    type: number
    sql: ${TABLE}."PRODUCT_CODE" ;;
  }

  dimension: product_description {
    type: string
    sql: ${TABLE}."PRODUCT_DESCRIPTION" ;;
  }

  dimension: product_tun {
    type: string
    sql: ${TABLE}."PRODUCT_TUN" ;;
  }

  dimension: qty_ordered {
    type: number
    sql: ${TABLE}."QTY_ORDERED" ;;
  }

  dimension: qty_per_case {
    type: number
    sql: ${TABLE}."QTY_PER_CASE" ;;
  }

  dimension: qty_supplied {
    type: number
    sql: ${TABLE}."QTY_SUPPLIED" ;;
  }

  dimension: source_stream {
    type: string
    sql: ${TABLE}."SOURCE_STREAM" ;;
  }

  dimension: tobacco_license {
    type: string
    sql: ${TABLE}."TOBACCO_LICENSE" ;;
  }

  dimension: total_deal {
    type: number
    sql: ${TABLE}."TOTAL_DEAL" ;;
  }

  dimension_group: trans {
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
    sql: ${TABLE}."TRANS_DATE" ;;
  }

  dimension: trans_date_raw {
    datatype: date
    sql: ${TABLE}."TRANS_DATE" ;;
  }

  dimension: trans_type {
    type: string
    sql: ${TABLE}."TRANS_TYPE" ;;
  }

  dimension: unit_of_measure_in_mls {
    type: number
    sql: ${TABLE}."UNIT_OF_MEASURE_IN_MLS" ;;
  }

  dimension: units_per_carton {
    type: number
    sql: ${TABLE}."UNITS_PER_CARTON" ;;
  }

  dimension: wet_value {
    type: number
    sql: ${TABLE}."WET_VALUE" ;;
  }

  dimension: wsale_value {
    type: number
    sql: ${TABLE}."WSALE_VALUE" ;;
  }

  measure: count {
    type: count
    drill_fields: [group_name, outlet_name]
  }

  measure: total_quantity_supplied  {
    type: sum
    sql: ${qty_supplied} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [invoice_number, outlet_id, outlet_name, product_code,product_description, qty_ordered, qty_supplied, qty_per_case, wsale_value, base_price, total_quantity_supplied, total_wholesale_amount]
  }

  measure: total_wholesale_amount  {
    type: sum
    sql: ${wsale_value} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [invoice_number, outlet_id, outlet_name, product_code,product_description, qty_ordered, qty_supplied, qty_per_case, wsale_value, base_price, total_quantity_supplied, total_wholesale_amount]
  }

  measure: distinct_quantity_per_case  {
    type: min
    sql: ${qty_per_case} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [invoice_number, outlet_id, outlet_name, product_code,product_description, qty_ordered, qty_supplied, qty_per_case, wsale_value, base_price, total_quantity_supplied, total_wholesale_amount]
  }


  measure: quantity_by_case  {
    sql: ${total_quantity_supplied}/${distinct_quantity_per_case} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [invoice_number, outlet_id, outlet_name, product_code,product_description, qty_ordered, qty_supplied, qty_per_case, wsale_value, base_price, total_quantity_supplied, total_wholesale_amount, quantity_by_case]
  }

}
