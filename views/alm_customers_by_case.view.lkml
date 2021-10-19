view: alm_customers_by_case {
  derived_table: {
    sql: with current_month as (
      select outlet_name,
      coalesce(sum(QTY_SUPPLIED/QTY_PER_CASE),0) cases_sold_curr_month,
      coalesce(sum(WSALE_VALUE),0) WHOLESALE_AUD_curr_month
      from SALES.ALM_SALES_BY_ORDER
        where ((TO_CHAR(TO_DATE(alm_sales_by_order."TRANS_DATE" ), 'YYYY-MM-DD'))) >=((TO_DATE(DATE_TRUNC('month', CURRENT_DATE())))) AND ( (TO_CHAR(TO_DATE(alm_sales_by_order."TRANS_DATE" ), 'YYYY-MM-DD')) ) < ((TO_DATE(DATEADD('month', 1, DATE_TRUNC('month', CURRENT_DATE())))))
      group by outlet_name
        ),
       last_3_months as (
      select outlet_name,
      coalesce(sum(QTY_SUPPLIED/QTY_PER_CASE),0) cases_sold_last_3_months,
      coalesce(sum(WSALE_VALUE),0) WHOLESALE_AUD_last_3_months
      from SALES.ALM_SALES_BY_ORDER
        where ( (TO_CHAR(TO_DATE(alm_sales_by_order."TRANS_DATE" ), 'YYYY-MM-DD')) )>=((TO_DATE(DATEADD('month', -3, DATE_TRUNC('month', CURRENT_DATE()))))) AND ( (TO_CHAR(TO_DATE(alm_sales_by_order."TRANS_DATE" ), 'YYYY-MM-DD')) ) < ((TO_DATE(DATEADD('month', 3, DATEADD('month', -3, DATE_TRUNC('month', CURRENT_DATE()))))))
      group by outlet_name
        ),
       last_6_months as (
      select outlet_name,
      coalesce(sum(QTY_SUPPLIED/QTY_PER_CASE),0) cases_sold_last_6_months,
      coalesce(sum(WSALE_VALUE),0) WHOLESALE_AUD_last_6_months
      from SALES.ALM_SALES_BY_ORDER
        where ( (TO_CHAR(TO_DATE(alm_sales_by_order."TRANS_DATE" ), 'YYYY-MM-DD')) )>=((TO_DATE(DATEADD('month', -6, DATE_TRUNC('month', CURRENT_DATE()))))) AND ( (TO_CHAR(TO_DATE(alm_sales_by_order."TRANS_DATE" ), 'YYYY-MM-DD')) ) < ((TO_DATE(DATEADD('month', 6, DATEADD('month', -6, DATE_TRUNC('month', CURRENT_DATE()))))))
      group by outlet_name
        ),
         last_3to6_months as (
      select outlet_name,
      coalesce(sum(QTY_SUPPLIED/QTY_PER_CASE),0) cases_sold_last_3to6_months,
      coalesce(sum(WSALE_VALUE),0) WHOLESALE_AUD_last_3to6_months
      from SALES.ALM_SALES_BY_ORDER
        where ( (TO_CHAR(TO_DATE(alm_sales_by_order."TRANS_DATE" ), 'YYYY-MM-DD')) )>=((TO_DATE(DATEADD('month', -6, DATE_TRUNC('month', CURRENT_DATE()))))) AND ( (TO_CHAR(TO_DATE(alm_sales_by_order."TRANS_DATE" ), 'YYYY-MM-DD')) ) < ((TO_DATE(DATEADD('month', 3, DATEADD('month', -5, DATE_TRUNC('month', CURRENT_DATE()))))))
      group by outlet_name
        ),
        older_than_6_months as (
      select  outlet_name,
      coalesce(sum(QTY_SUPPLIED/QTY_PER_CASE),0) cases_sold_older_than_6_months,
      coalesce(sum(WSALE_VALUE),0) WHOLESALE_AUD_older_than_6_months
      from SALES.ALM_SALES_BY_ORDER
        where ( (TO_CHAR(TO_DATE(alm_sales_by_order."TRANS_DATE" ), 'YYYY-MM-DD')) )<((TO_DATE(DATEADD('month', -6, DATE_TRUNC('month', CURRENT_DATE())))))
      group by outlet_name
        ),
     sales as
     (select distinct s.outlet_name,
      coalesce(cases_sold_curr_month,0) cases_sold_curr_month,
      coalesce(cases_sold_last_3_months,0) cases_sold_last_3_months,
      coalesce(cases_sold_last_6_months,0) cases_sold_last_6_months,
      coalesce(cases_sold_last_3to6_months,0) cases_sold_last_3to6_months,
      coalesce(cases_sold_older_than_6_months,0) cases_sold_older_than_6_months,
      coalesce(WHOLESALE_AUD_curr_month,0) WHOLESALE_AUD_curr_month,
      coalesce(WHOLESALE_AUD_last_3_months,0) WHOLESALE_AUD_last_3_months,
      coalesce(WHOLESALE_AUD_last_6_months,0) WHOLESALE_AUD_last_6_months,
      coalesce(WHOLESALE_AUD_last_3to6_months,0) WHOLESALE_AUD_last_3to6_months,
      coalesce(WHOLESALE_AUD_older_than_6_months,0) WHOLESALE_AUD_older_than_6_months
      from
      SALES.ALM_SALES_BY_ORDER s
      left outer join current_month cm on cm.outlet_name = s.outlet_name
      left outer join last_3_months m3 on m3.outlet_name = s.outlet_name
      left outer join last_6_months m6 on m6.outlet_name = s.outlet_name
      left outer join last_3to6_months m3_6 on m3_6.outlet_name = s.outlet_name
      left outer join older_than_6_months mo on mo.outlet_name = s.outlet_name
     )

      select  outlet_name,
      cases_sold_curr_month,
      cases_sold_last_3_months,
      cases_sold_last_6_months,
      cases_sold_last_3to6_months,
      cases_sold_older_than_6_months,
      WHOLESALE_AUD_curr_month,
      WHOLESALE_AUD_last_3_months,
      WHOLESALE_AUD_last_6_months,
      WHOLESALE_AUD_last_3to6_months,
      WHOLESALE_AUD_older_than_6_months,
      case when cases_sold_curr_month <> 0 then (WHOLESALE_AUD_curr_month/cases_sold_curr_month) else 0 end WHOLESALE_AUD_per_case_curr_month,
      case when cases_sold_last_3_months <> 0 then (WHOLESALE_AUD_last_3_months/cases_sold_last_3_months) else 0 end WHOLESALE_AUD_per_case_last_3_months,
      case when cases_sold_last_6_months <> 0 then (WHOLESALE_AUD_last_6_months/cases_sold_last_6_months) else 0 end WHOLESALE_AUD_per_case_last_6_months,
      case when cases_sold_last_3to6_months <> 0 then (WHOLESALE_AUD_last_3to6_months/cases_sold_last_3to6_months) else 0 end WHOLESALE_AUD_per_case_older_than_3to_months,
      case when cases_sold_older_than_6_months <> 0 then (WHOLESALE_AUD_older_than_6_months/cases_sold_older_than_6_months) else 0 end WHOLESALE_AUD_per_case_older_than_6_months
      from
      sales s
      order by cases_sold_curr_month desc
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: outlet_name {
    type: string
    sql: ${TABLE}."OUTLET_NAME" ;;
    primary_key: yes
  }

  dimension: cases_sold_curr_month {
    type: number
    sql: ${TABLE}."CASES_SOLD_CURR_MONTH" ;;
    value_format_name: quantity_format
  }

  dimension: cases_sold_last_3_months {
    type: number
    sql: ${TABLE}."CASES_SOLD_LAST_3_MONTHS" ;;
    value_format_name: quantity_format
  }

  dimension: cases_sold_last_6_months {
    type: number
    sql: ${TABLE}."CASES_SOLD_LAST_6_MONTHS" ;;
    value_format_name: quantity_format
  }

  dimension: cases_sold_last_3_to6_months {
    type: number
    sql: ${TABLE}."CASES_SOLD_LAST_3TO6_MONTHS" ;;
    value_format_name: quantity_format
  }

  dimension: cases_sold_older_than_6_months {
    type: number
    sql: ${TABLE}."CASES_SOLD_OLDER_THAN_6_MONTHS" ;;
    value_format_name: quantity_format
  }

  dimension: wholesale_aud_curr_month {
    type: number
    sql: ${TABLE}."WHOLESALE_AUD_CURR_MONTH" ;;
    value_format_name: aud_currency_format
  }

  dimension: wholesale_aud_last_3_months {
    type: number
    sql: ${TABLE}."WHOLESALE_AUD_LAST_3_MONTHS" ;;
    value_format_name: aud_currency_format
  }

  dimension: wholesale_aud_last_6_months {
    type: number
    sql: ${TABLE}."WHOLESALE_AUD_LAST_6_MONTHS" ;;
    value_format_name: aud_currency_format
  }

  dimension: wholesale_aud_last_3_to6_months {
    type: number
    sql: ${TABLE}."WHOLESALE_AUD_LAST_3TO6_MONTHS" ;;
    value_format_name: aud_currency_format
  }

  dimension: wholesale_aud_older_than_6_months {
    type: number
    sql: ${TABLE}."WHOLESALE_AUD_OLDER_THAN_6_MONTHS" ;;
    value_format_name: aud_currency_format
  }

  dimension: wholesale_aud_per_case_curr_month {
    type: number
    sql: ${TABLE}."WHOLESALE_AUD_PER_CASE_CURR_MONTH" ;;
    value_format_name: aud_currency_format
  }

  dimension: wholesale_aud_per_case_last_3_months {
    type: number
    sql: ${TABLE}."WHOLESALE_AUD_PER_CASE_LAST_3_MONTHS" ;;
    value_format_name: aud_currency_format
  }

  dimension: wholesale_aud_per_case_last_6_months {
    type: number
    sql: ${TABLE}."WHOLESALE_AUD_PER_CASE_LAST_6_MONTHS" ;;
    value_format_name: aud_currency_format
  }

  dimension: wholesale_aud_per_case_older_than_3_to_months {
    type: number
    sql: ${TABLE}."WHOLESALE_AUD_PER_CASE_OLDER_THAN_3TO_MONTHS" ;;
    value_format_name: aud_currency_format
  }

  dimension: wholesale_aud_per_case_older_than_6_months {
    type: number
    sql: ${TABLE}."WHOLESALE_AUD_PER_CASE_OLDER_THAN_6_MONTHS" ;;
    value_format_name: aud_currency_format
  }

  set: detail {
    fields: [
      outlet_name,
      cases_sold_curr_month,
      cases_sold_last_3_months,
      cases_sold_last_6_months,
      cases_sold_last_3_to6_months,
      cases_sold_older_than_6_months,
      wholesale_aud_curr_month,
      wholesale_aud_last_3_months,
      wholesale_aud_last_6_months,
      wholesale_aud_last_3_to6_months,
      wholesale_aud_older_than_6_months,
      wholesale_aud_per_case_curr_month,
      wholesale_aud_per_case_last_3_months,
      wholesale_aud_per_case_last_6_months,
      wholesale_aud_per_case_older_than_3_to_months,
      wholesale_aud_per_case_older_than_6_months
    ]
  }
}
