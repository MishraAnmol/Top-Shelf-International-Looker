view: sales_by_state {
  derived_table: {
    sql: select state, SUM((sales_by_order."NET_SALES_AMOUNT_AUD") ) total_sales_by_state from  "ANALYTICS_DATABASE"."SALES"."SALES_BY_ORDER" group by 1
      ;;
  }



  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
    primary_key: yes
  }

  dimension: sales_by_state {
    type: number
    sql: ${TABLE}."TOTAL_SALES_BY_STATE" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_sales_by_state {
    type: sum
    html: @{aud_currency_format}  ;;
    sql: ${TABLE}."TOTAL_SALES_BY_STATE" ;;
  }


  set: detail {
    fields: [state, total_sales_by_state]
  }
}
