view: alm_bonus_stocks {
  derived_table: {
    sql: select ts1.PRODUCT_DESCRIPTION, ts1.OUTLET_NAME,  ts1.GROUP_NAME, sum(ts1.QTY_SUPPLIED) BONUS_STOCKS_SUPPLIED , sum(nvl(ts2.QTY_SUPPLIED,0)) PRODUCTS_QTY_SUPPLIED
      from  "ANALYTICS_DATABASE"."SALES"."ALM_SALES_BY_ORDER" ts1
      left outer join (select OUTLET_NAME,PRODUCT_DESCRIPTION, GROUP_NAME,ORDER_TYPE, cast(QTY_ORDERED as integer) QTY_ORDERED, cast(QTY_SUPPLIED as integer) QTY_SUPPLIED
      from  "ANALYTICS_DATABASE"."SALES"."ALM_SALES_BY_ORDER" where order_type <> 'B') ts2 on ts1.OUTLET_NAME= ts2.OUTLET_NAME and ts1.PRODUCT_DESCRIPTION = ts2.PRODUCT_DESCRIPTION and ts1.GROUP_NAME = ts2.GROUP_NAME
      where ts1.order_type='B'
      group by ts1.OUTLET_NAME, ts1.PRODUCT_DESCRIPTION, ts1.GROUP_NAME
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: product_description {
    type: string
    sql: ${TABLE}."PRODUCT_DESCRIPTION" ;;
  }

  dimension: outlet_name {
    type: string
    sql: ${TABLE}."OUTLET_NAME" ;;
    primary_key:  yes
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}."GROUP_NAME" ;;
  }

  dimension: bonus_stocks_supplied {
    type: number
    sql: ${TABLE}."BONUS_STOCKS_SUPPLIED" ;;
  }

  dimension: products_qty_supplied {
    type: number
    sql: ${TABLE}."PRODUCTS_QTY_SUPPLIED" ;;
  }

  measure: stock_difference {
    type: number
    sql: ${products_qty_supplied} - ${bonus_stocks_supplied} ;;
  }

  measure: stock_trends{
    type: number
    sql: case when ${products_qty_supplied} = 0 then 0 else ${stock_difference}/ ${products_qty_supplied} end;;
    value_format: "0%"
  }

  set: detail {
    fields: [product_description, outlet_name, group_name, bonus_stocks_supplied, products_qty_supplied]
  }
}
