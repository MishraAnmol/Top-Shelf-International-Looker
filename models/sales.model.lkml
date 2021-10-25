connection: "tsi-analytics"

# include all the views
include: "/views/**/*.view"


datagroup: sales_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sales_default_datagroup

named_value_format: aud_currency_format {
  value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  strict_value_format: yes
}

named_value_format: quantity_format {
  value_format: "#,##0"
  strict_value_format: yes
}


explore: sales_by_order {
  join: top_brand {
    type: inner
    foreign_key: customer_title
    relationship: one_to_one
  }
  join: contribution_margins {
    type: left_outer
    foreign_key: fiscal_month_name_fy
    relationship: one_to_one
  }
}

explore: alm_sales_by_order {}


explore: alm_stock_on_hand {}
