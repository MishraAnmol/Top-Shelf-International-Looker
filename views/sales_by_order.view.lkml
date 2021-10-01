view: sales_by_order {
  sql_table_name: "SALES"."SALES_BY_ORDER"
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

  dimension: c1_margin_aud {
    type: number
    sql: ${TABLE}."C1_MARGIN_AUD" ;;
  }

  dimension: c2_margin_aud {
    type: number
    sql: ${TABLE}."C2_MARGIN_AUD" ;;
  }

  dimension: cds_aud {
    type: number
    sql: ${TABLE}."CDS_AUD" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: cost_mrp {
    type: number
    sql: ${TABLE}."COST_MRP" ;;
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

  dimension: customer_code {
    type: string
    sql: ${TABLE}."CUSTOMER_CODE" ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: customer_order_id {
    type: number
    sql: ${TABLE}."CUSTOMER_ORDER_ID" ;;
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

  dimension: discount_value_1 {
    type: number
    sql: ${TABLE}."DISCOUNT_VALUE_1" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: excise_aud {
    type: number
    sql: ${TABLE}."EXCISE_AUD" ;;
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

  dimension: freight_aud {
    type: number
    sql: ${TABLE}."FREIGHT_AUD" ;;
  }

  dimension: gross_sales_amount_aud {
    type: number
    sql: ${TABLE}."GROSS_SALES_AMOUNT_AUD" ;;
  }

  dimension: invoice_code {
    type: string
    sql: ${TABLE}."INVOICE_CODE" ;;
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

  dimension: invoice_number {
    type: number
    sql: ${TABLE}."INVOICE_NUMBER" ;;
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

  dimension: net_sales_amount_aud {
    type: number
    sql: ${TABLE}."NET_SALES_AMOUNT_AUD" ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."PHONE" ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}."PRODUCT_CODE" ;;
  }

  dimension: product_cogs_aud {
    type: number
    sql: ${TABLE}."PRODUCT_COGS_AUD" ;;
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

  dimension: source_stream {
    type: string
    sql: ${TABLE}."SOURCE_STREAM" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: tax_exempt {
    type: yesno
    sql: ${TABLE}."TAX_EXEMPT" ;;
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
    drill_fields: [first_name, last_name, brand_name]
  }

  measure: order_count {
    type: count_distinct
    sql: ${customer_order_id} ;;
    drill_fields: [first_name, last_name, brand_name]
  }

  measure: total_sales_quantity  {
    type: sum
    sql: ${sales_quantity} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [source_stream,invoice_code, customer_channel, product_title, brand_type, brand_name, net_sales_amount, gross_sales_amount_aud, product_cogs_amount, excise_amount, freight_amount, cds_amount, c1_margin, c2_margin, c1_margin_perc, c2_margin_perc]
  }

  measure: net_sales_amount  {
    type: sum
    sql: ${net_sales_amount_aud} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [source_stream,invoice_code, customer_channel, product_title, brand_type, brand_name, net_sales_amount, gross_sales_amount_aud, product_cogs_amount, excise_amount, freight_amount, cds_amount, c1_margin, c2_margin, c1_margin_perc, c2_margin_perc]
  }

  measure: gross_sales_amount  {
    type: sum
    sql: ${gross_sales_amount_aud} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [source_stream,invoice_code, customer_channel, product_title, brand_type, brand_name, net_sales_amount, gross_sales_amount_aud, product_cogs_amount, excise_amount, freight_amount, cds_amount, c1_margin, c2_margin, c1_margin_perc, c2_margin_perc]
  }

  measure: product_cogs_amount  {
    type: sum
    sql: ${product_cogs_aud} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [source_stream,invoice_code, customer_channel, product_title, brand_type, brand_name, net_sales_amount, gross_sales_amount_aud, product_cogs_amount, excise_amount, freight_amount, cds_amount, c1_margin, c2_margin, c1_margin_perc, c2_margin_perc]
  }

  measure: excise_amount  {
    type: sum
    sql: ${excise_aud} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [source_stream,invoice_code, customer_channel, product_title, brand_type, brand_name, net_sales_amount, gross_sales_amount_aud, product_cogs_amount, excise_amount, freight_amount, cds_amount, c1_margin, c2_margin, c1_margin_perc, c2_margin_perc]
  }

  measure: freight_amount  {
    type: sum
    sql: ${freight_aud} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [source_stream,invoice_code, customer_channel, product_title, brand_type, brand_name, net_sales_amount, gross_sales_amount_aud, product_cogs_amount, excise_amount, freight_amount, cds_amount, c1_margin, c2_margin, c1_margin_perc, c2_margin_perc]
  }

  measure: cds_amount  {
    type: sum
    sql: ${cds_aud} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [source_stream,invoice_code, customer_channel, product_title, brand_type, brand_name, net_sales_amount, gross_sales_amount_aud, product_cogs_amount, excise_amount, freight_amount, cds_amount, c1_margin, c2_margin, c1_margin_perc, c2_margin_perc]
  }

  measure: c1_margin  {
    type: sum
    sql: ${c1_margin_aud} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [source_stream,invoice_code, customer_channel, product_title, brand_type, brand_name, net_sales_amount, gross_sales_amount_aud, product_cogs_amount, excise_amount, freight_amount, cds_amount, c1_margin, c2_margin, c1_margin_perc, c2_margin_perc]
  }

  measure: c2_margin  {
    type: sum
    sql: ${c2_margin_aud} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [source_stream,invoice_code, customer_channel, product_title, brand_type, brand_name, net_sales_amount, gross_sales_amount_aud, product_cogs_amount, excise_amount, freight_amount, cds_amount, c1_margin, c2_margin, c1_margin_perc, c2_margin_perc]
  }

  measure: c1_margin_perc  {
    sql: ${c1_margin}*100/${net_sales_amount} ;;
    value_format: "0.00\%"
    drill_fields: [source_stream,invoice_code, customer_channel, product_title, brand_type, brand_name, net_sales_amount, gross_sales_amount_aud, product_cogs_amount, excise_amount, freight_amount, cds_amount, c1_margin, c2_margin, c1_margin_perc, c2_margin_perc]
  }

  measure: c2_margin_perc  {
    sql: ${c2_margin}*100/${net_sales_amount} ;;
    value_format: "0.00\%"
    drill_fields: [source_stream,invoice_code, customer_channel, product_title, brand_type, brand_name, net_sales_amount, gross_sales_amount_aud, product_cogs_amount, excise_amount, freight_amount, cds_amount, c1_margin, c2_margin, c1_margin_perc, c2_margin_perc]
  }
}
