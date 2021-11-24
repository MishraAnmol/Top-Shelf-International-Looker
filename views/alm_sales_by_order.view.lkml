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

  dimension: total_base_price_dim {
    type: number
    sql: ${TABLE}."TOTAL_BASE_PRICE" ;;
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

  dimension: product_brand {
    type: string
    sql: ${TABLE}."PRODUCT_BRAND" ;;
  }

  dimension: product_group {
    type: string
    sql: ${TABLE}."PRODUCT_GROUP" ;;
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

  dimension: is_before_mtd {
    type: yesno
    sql: EXTRACT(DAY FROM ${trans_raw}) <= EXTRACT(DAY FROM current_date);;
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

  dimension: total_wsale_price {
    type: number
    sql: ${TABLE}."TOTAL_WSALE_PRICE" ;;
  }

  dimension: wsale_price_per_case {
    type: number
    sql: ${TABLE}."WSALE_PRICE_PER_CASE" ;;
  }

  set: alm_customer_details {
    fields: [outlet_name, outlet_state, product_group, product_code, product_description, qty_supplied, qty_supplied_by_case, bonus_stock_cases, wsale_price_per_case]
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

  measure: total_qty_supplied_by_case_format  {
    type: sum
    sql: ${qty_supplied_by_case} ;;
    html: @{margin_values_format}  ;;
    drill_fields: [alm_customer_details*]
  }

  measure: purchased_cases {
    type: sum
    sql: CASE WHEN ((${TABLE}."ORDER_TYPE") <> 'B' OR (${TABLE}."ORDER_TYPE") IS NULL) THEN ( ${TABLE}."QTY_SUPPLIED_BY_CASE"  )  ELSE 0 END ;;
    value_format: "#,##0"
    drill_fields: [alm_customer_details*]
  }

  measure: purchased_cases_price {
    type: sum
    sql: CASE WHEN ((${TABLE}."ORDER_TYPE") <> 'B' OR (${TABLE}."ORDER_TYPE") IS NULL) THEN ( ${TABLE}."TOTAL_WSALE_PRICE"  )  ELSE 0 END ;;
    value_format: "$#,##0.00"
    drill_fields: [alm_customer_details*]
  }

  measure: bonus_stock_cases {
    type: sum
    sql: CASE WHEN ((${TABLE}."ORDER_TYPE") = 'B') THEN ( ${TABLE}."QTY_SUPPLIED_BY_CASE"  )  ELSE 0 END ;;
    value_format: "#,##0"
    drill_fields: [alm_customer_details*]
  }

  measure: bonus_stock_price {
    type: sum
    sql: CASE WHEN ((${TABLE}."ORDER_TYPE") = 'B') THEN ( ${TABLE}."TOTAL_BASE_PRICE"  )  ELSE 0 END ;;
    value_format: "$#,##0.00"
    drill_fields: [alm_customer_details*]
  }

  measure: bonus_case_perc {
    type: number
    sql: ${bonus_stock_cases}/(${bonus_stock_cases}+${purchased_cases});;
    value_format: "###.00"
    drill_fields: [alm_customer_details*]
  }

  measure: this_or_that {
    type: yesno
    sql: ((${purchased_cases}+${bonus_stock_cases})>=50 OR ${bonus_stock_cases}>=10) AND ${bonus_case_perc}>=0.05;;
}

  measure: total_qty_ordered_by_case  {
    type: sum
    sql: ${qty_ordered_by_case} ;;
    value_format: "[>=0]#,##0.00;[<0]-#,##0.00"
    drill_fields: [alm_customer_details*]
  }

 measure: total_sale_price {
    type: sum
    sql: ${total_wsale_price} ;;
    value_format: "$#,##0.00"
    drill_fields: [alm_customer_details*]
  }

  measure: total_sale_price_format {
    type: sum
    sql: ${total_wsale_price} ;;
    html: @{aud_currency_format}  ;;
    drill_fields: [alm_customer_details*]
  }

measure: total_base_price {
    type: sum
    sql: ${total_base_price_dim} ;;
    value_format: "[>=0]$#,##0.00;[<0]$-#,##0.00"
    drill_fields: [alm_customer_details*]
  }


measure: total_wsale_price_per_case {
    type: sum
    sql: ${wsale_price_per_case} ;;
    value_format: "[>=0]$#,##0.00;[<0]$-#,##0.00"
    drill_fields: [alm_customer_details*]
  }

measure: adjusted_sale_price {
    type: number
    sql: ${purchased_cases_price}-${bonus_stock_price} ;;
    value_format: "[>=0]#,##0.00;[<0]-#,##0.00"
    drill_fields: [alm_customer_details*]
  }

  measure: price_variance {
    type: number
    sql: ${total_base_price}-${adjusted_sale_price};;
    value_format: "#,##0.00"
    drill_fields: [alm_customer_details*]
  }

  measure: price_variance_perc {
    type: number
    sql: case when ${total_base_price} = 0 then 0 else (${total_base_price}-${adjusted_sale_price})/${total_base_price} end;;
    value_format: "###.00"
    drill_fields: [alm_customer_details*]
  }

}
