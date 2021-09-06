connection: "tsi-analytics"

# include all the views
include: "/views/**/*.view"

datagroup: sales_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sales_default_datagroup

explore: claim_by_product {}

#explore: sales_by_order {}

explore: sales_by_order {
  join: claim_by_product {
    relationship: one_to_one
    sql_on: ${sales_by_order.product_id}=${claim_by_product.product_id};;
    type: left_outer  # Could be excluded since left_outer is the default
  }
}
