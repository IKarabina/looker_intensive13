connection: "tpchlooker"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: li13_iryna_karabina_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: li13_iryna_karabina_default_datagroup



explore: d_customer {
  hidden: yes
}

explore: d_dates {
  hidden: yes
}

explore: d_part {
  hidden: yes
}

explore: d_supplier {
  hidden: yes
}

explore: f_lineitems {
  label: "Orders - Line Items"
  view_label: "Orders"

  join: d_customer {
    type: left_outer
    sql_on: ${f_lineitems.l_custkey}=${d_customer.c_custkey} ;;
    relationship: many_to_one
    view_label: "Customer"
  }

  join: d_supplier{
    type: left_outer
    sql_on: ${f_lineitems.l_suppkey}=${d_supplier.s_suppkey} ;;
    relationship: many_to_one
    view_label: "Supplier"
  }

  join: d_part{
    type: left_outer
    sql_on: ${f_lineitems.l_partkey}=${d_part.p_partkey} ;;
    relationship: many_to_one
    view_label: "Part"
  }

  join: order_dates{
    from: d_dates
    type: left_outer
    sql_on: ${f_lineitems.l_orderdatekey}=${order_dates.datekey} ;;
    relationship: many_to_one
    view_label: "Order Date"
  }

  join: ship_dates{
    from: d_dates
    type: left_outer
    sql_on: ${f_lineitems.l_shipdatekey}=${ship_dates.datekey} ;;
    relationship: many_to_one
    view_label: "Ship Date"
  }

  join: receipt_dates{
    from: d_dates
    type: left_outer
    sql_on: ${f_lineitems.l_receiptdatekey}=${receipt_dates.datekey} ;;
    relationship: many_to_one
    view_label: "Receipt Date"
  }

  join: commit_dates{
    from: d_dates
    type: left_outer
    sql_on: ${f_lineitems.l_commitdatekey}=${commit_dates.datekey} ;;
    relationship: many_to_one
    view_label: "Commit Date"
  }
}

# copy explore to test look without PDT
explore: orderitems {
  label: "Order Items (Copy)"
  view_label: "Orders"
}

datagroup: daily_datagroup {
  sql_trigger: SELECT CURRENT_TIMESTAMP() ;;
  max_cache_age: "24 hours"
}

# copy explore to test PDT
explore: orderitems_pdt1 {
  label: "Order Items (with_PDT)"
  view_label: "Orders"

}
