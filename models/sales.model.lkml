connection: "tsi-analytics"

# include all the views
include: "/views/**/*.view"

datagroup: sales_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sales_default_datagroup

explore: claim_by_product {}

explore: sales_by_order {}
