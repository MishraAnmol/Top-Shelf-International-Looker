view: alm_stock_on_hand {
  sql_table_name: "SALES"."ALM_STOCK_ON_HAND"
    ;;

  dimension: alm_item {
    type: number
    sql: ${TABLE}."ALM_ITEM" ;;
  }

  dimension: item_description {
    type: string
    sql: ${TABLE}."ITEM_DESCRIPTION" ;;
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

  dimension: location_name {
    type: string
    sql: ${TABLE}."LOCATION_NAME" ;;
  }

  measure: soh_cases {
    type: sum
    sql: ${TABLE}."SOH_CASES" ;;
  }

  measure: count {
    type: count
    drill_fields: [location_name, alm_item]
  }
}
