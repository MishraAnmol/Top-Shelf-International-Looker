view: alm_sales_by_order {
  sql_table_name: "SALES"."ALM_SALES_BY_ORDER"
    ;;

  dimension: adjust_number {
    type: number
    sql: ${TABLE}."ADJUST_NUMBER" ;;
  }

  dimension: base_price_per_case {
    type: number
    sql: ${TABLE}."BASE_PRICE_PER_CASE" ;;
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

  dimension: fiscal_month_name_fy {
    type: string
    sql: ${TABLE}."FISCAL_MONTH_NAME_FY" ;;
  }

  dimension: fiscal_month_customer_sort {
    label: "Fiscal Month (Custom Sort)"
    case: {
      when: {
        sql: ${fiscal_month_name_fy} like '%Jul' ;;
        label: "July"
      }
      when: {
        sql: ${fiscal_month_name_fy} like '%Aug' ;;
        label: "August"
      }
      when: {
        sql: ${fiscal_month_name_fy} like '%Sep' ;;
        label: "September"
      }
      when: {
        sql: ${fiscal_month_name_fy} like '%Oct' ;;
        label: "October"
      }
      when: {
        sql: ${fiscal_month_name_fy} like '%Nov' ;;
        label: "November"
      }
      when: {
        sql: ${fiscal_month_name_fy} like '%Dec' ;;
        label: "December"
      }
      when: {
        sql: ${fiscal_month_name_fy} like '%Jan' ;;
        label: "January"
      }
      when: {
        sql: ${fiscal_month_name_fy} like '%Feb' ;;
        label: "February"
      }
      when: {
        sql: ${fiscal_month_name_fy} like '%Mar' ;;
        label: "March"
      }
      when: {
        sql: ${fiscal_month_name_fy} like '%Apr' ;;
        label: "April"
      }
      when: {
        sql: ${fiscal_month_name_fy} like '%May' ;;
        label: "May"
      }
      when: {
        sql: ${fiscal_month_name_fy} like '%Jun' ;;
        label: "June"
      }
    }
  }

  dimension: fiscal_quarter_name_fy {
    type: string
    sql: ${TABLE}."FISCAL_QUARTER_NAME_FY" ;;
  }

  dimension: week_of_fiscal_year {
    type: string
    sql: ${TABLE}."WEEK_OF_FISCAL_YEAR" ;;
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

  dimension: qty_supplied_by_case {
    type: number
    sql: ${TABLE}."QTY_SUPPLIED_BY_CASE" ;;
  }

  dimension: qty_ordered_by_case {
    type: number
    sql: ${TABLE}."QTY_ORDERED_BY_CASE" ;;
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

  dimension: wsale_price {
    type: number
    sql: ${TABLE}."WSALE_PRICE" ;;
  }

  dimension: wsale_price_per_case {
    type: number
    sql: ${TABLE}."WSALE_PRICE_PER_CASE" ;;
  }

  set: alm_customer_details {
    fields: []
  }

  measure: count {
    type: count
    drill_fields: [group_name, outlet_name]
  }

  measure: total_qty_supplied  {
    type: sum
    sql: ${qty_supplied} ;;
    value_format_name: quantity_format
    drill_fields: [alm_customer_details*]
  }

  measure: total_qty_supplied_by_case  {
    type: sum
    sql: ${qty_supplied_by_case} ;;
    value_format: "#,##0"
    drill_fields: [alm_customer_details*]
  }

  measure: total_qty_ordered_by_case  {
    type: sum
    sql: ${qty_ordered_by_case} ;;
    value_format: "[>=0]#,##0.00;[<0]-#,##0.00"
    drill_fields: [alm_customer_details*]
  }


 measure: total_wsale_price {
    type: sum
    sql: ${wsale_price} ;;
    value_format_name: aud_currency_format
    drill_fields: [alm_customer_details*]
  }

measure: total_base_price_per_case {
    type: sum
    sql: ${base_price_per_case} ;;
    value_format: "[>=0]$#,##0.00;[<0]$-#,##0.00"
    drill_fields: [alm_customer_details*]
  }

measure: total_wsale_price_per_case {
    type: sum
    sql: ${wsale_price_per_case} ;;
    value_format: "[>=0]$#,##0.00;[<0]$-#,##0.00"
    drill_fields: [alm_customer_details*]
  }

measure: discount_value {
    type: number
    sql: ${total_base_price_per_case}-${total_wsale_price_per_case} ;;
    value_format: "[>=0]#,##0.00;[<0]-#,##0.00"
    drill_fields: [alm_customer_details*]
  }

}
