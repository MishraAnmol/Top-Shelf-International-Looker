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

named_value_format: margin_values_format {
  value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  strict_value_format: yes
}

named_value_format: quantity_format {
  value_format: "#,##0"
  strict_value_format: yes
}

named_value_format: integer_format {
  value_format: "0"
  strict_value_format: yes
}


explore: sales_by_order {
  sql_always_where:${brand_name} = 'NED' OR ${brand_name} = 'Grainshaker' OR ${brand_name} = '3rd Party' OR ${item_code} = 'Rebate' ;;
  join: sales_by_state {
    type: inner
    foreign_key: state
    relationship: one_to_one
  }
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
  join: sales_by_order_prev_3months {
    type: left_outer
    foreign_key: fiscal_month_name_fy
    relationship: many_to_one
  }
  join: sales_by_order_customer_count {
    type: left_outer
    foreign_key: fiscal_month_name_fy
    relationship: many_to_one
  }
}


explore: alm_stock_on_hand {}

explore: top_product_brand_wise {}

explore: alm_sales_by_order {
  join: alm_customers_by_case {
    type: inner
    foreign_key: outlet_name
    relationship: one_to_one
  }
  join: alm_bonus_stocks {
    type: inner
    foreign_key: outlet_name
    relationship: one_to_one
  }
}
