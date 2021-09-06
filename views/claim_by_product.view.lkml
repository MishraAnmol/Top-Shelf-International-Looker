view: claim_by_product {
  sql_table_name: "SALES"."CLAIM_BY_PRODUCT"
    ;;

  dimension: bonus_qty {
    type: number
    sql: ${TABLE}."BONUS_QTY" ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}."BRAND_NAME" ;;
  }

  dimension: brand_type {
    type: string
    sql: ${TABLE}."BRAND_TYPE" ;;
  }

  dimension: claim_amount_aud {
    type: number
    sql: ${TABLE}."CLAIM_AMOUNT_AUD" ;;
  }

  dimension: claim_number {
    type: number
    sql: ${TABLE}."CLAIM_NUMBER" ;;
  }

  dimension: claim_quantity {
    type: number
    sql: ${TABLE}."CLAIM_QUANTITY" ;;
  }

  dimension: deal_code {
    type: number
    sql: ${TABLE}."DEAL_CODE" ;;
  }

  dimension: deal_qual {
    type: string
    sql: ${TABLE}."DEAL_QUAL" ;;
  }

  dimension: deal_value {
    type: number
    sql: ${TABLE}."DEAL_VALUE" ;;
  }

  dimension: end_date {
    type: number
    sql: ${TABLE}."END_DATE" ;;
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

  dimension: promo_description {
    type: string
    sql: ${TABLE}."PROMO_DESCRIPTION" ;;
  }

  dimension: promo_number {
    type: string
    sql: ${TABLE}."PROMO_NUMBER" ;;
  }

  dimension: promo_type {
    type: string
    sql: ${TABLE}."PROMO_TYPE" ;;
  }

  dimension: reference_code {
    type: string
    sql: ${TABLE}."REFERENCE_CODE" ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}."SIZE" ;;
  }

  dimension: source_stream {
    type: string
    sql: ${TABLE}."SOURCE_STREAM" ;;
  }

  dimension: start_date {
    type: number
    sql: ${TABLE}."START_DATE" ;;
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

  dimension: w_sale_pack {
    type: number
    sql: ${TABLE}."W_SALE_PACK" ;;
  }

  measure: count {
    type: count
    drill_fields: [brand_name]
  }
}
