view: f_lineitems {
  sql_table_name: "DATA_MART"."F_LINEITEMS" ;;

  dimension: l_availqty {
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
    label: "Available Quantity"
  }
  dimension: l_clerk {
    type: string
    sql: ${TABLE}."L_CLERK" ;;
    label: "Clerk"
  }
  dimension: l_commitdatekey {
    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
    hidden: yes
  }
  dimension: l_custkey {
    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
    hidden: yes
  }
  dimension: l_discount {
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
    label: "Discount"
  }
  dimension: l_extendedprice {
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
    label: "Extended Price"
  }
  dimension: l_linenumber {
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
    label: "Line Number"
  }
  dimension: l_orderdatekey {
    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
    hidden: yes
  }
  dimension: l_orderkey {
    primary_key: yes
    type: number
    sql: ${TABLE}."L_ORDERKEY" ;;
    label: "Order Key"
  }
  dimension: l_orderpriority {
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
    label: "Order Priotity"
  }
  dimension: l_orderstatus {
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
    label: "Order Status"
  }
  dimension: l_partkey {
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
    hidden: yes
  }
  dimension: l_quantity {
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
    label: "Quantity"
  }
  dimension: l_receiptdatekey {
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
    hidden: yes
  }
  dimension: l_returnflag {
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
    label: "Return Flag"
  }
  dimension: l_shipdatekey {
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
    hidden: yes
  }
  dimension: l_shipinstruct {
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
    label: "Shiping Struct"
  }
  dimension: l_shipmode {
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
    label: "Shiping Mode"
  }
  dimension: l_shippriority {
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
    label: "Shiping Priority"
  }
  dimension: l_suppkey {
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
    hidden: yes
  }
  dimension: l_supplycost {
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
    label: "Supply Cost"
  }
  dimension: l_tax {
    type: number
    sql: ${TABLE}."L_TAX" ;;
    label: "Tax"
  }
  dimension: l_totalprice {
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
    label: "Total Price"
  }

  dimension: customer_nation {
    type: string
    sql: ${d_customer.c_nation} ;;
    hidden: yes
  }

  measure: count {
    type: count
    label: "Order Count"
  }

  dimension: price_wo_tax {
    type: number
    sql: ${l_extendedprice} * (1-${l_discount}) ;;
    label: "Price w/o Taxes"
    value_format_name: usd
  }

  dimension: price_with_tax {
    type: number
    sql: ${price_wo_tax}*${l_tax} + ${price_wo_tax} ;;
    label: "Price with Taxes"
    value_format_name: usd
  }

  measure: total_sale_price {
    type: sum
    sql: ${price_with_tax} ;;
    value_format: "$#,##0.00,,\" M\""
    label: "Total Sale Price"
    description: "Total sales from items sold."
  }

  measure: average_sale_price {
    type: average
    sql: ${price_with_tax} ;;
    value_format_name: usd
    label: "Average Sale Price"
    description: "Average sale price of items sold."
  }

  measure: cumulative_total_sales {
    type: running_total
    sql: ${total_sale_price} ;;
    value_format: "$#,##0.00,,\" M\""
    label: "Cumulative Total Sales"
    description: "Cumulative total sales from items sold."
  }

  measure: total_sales_shipped_by_air {
    type: sum
    sql: ${price_with_tax} ;;
    value_format: "$#,##0.00,,\" M\""
    label: "Total Sale Price Shipped By Air"
    description: "Total sales of items shipped by air."
    filters: [
      l_shipmode: "AIR"
    ]
  }

  # WTF??? ARE YOU SERIOUS ABOUT THAT?? ONLY THIS COUNTRY WAS AVAILABLE FOR THE TASK??
  measure: total_russia_sales {
    type: sum
    sql: ${price_with_tax} ;;
    value_format: "$#,##0.00,,\" M\""
    label: "Total Russia Sales"
    description: "Total sales by customers from Russia."
    filters: [
      customer_nation: "RUSSIA"
    ]
  }

  measure: total_gross_revenue {
    type: sum
    sql: ${price_with_tax} ;;
    value_format: "$#,##0.00,,\" M\""
    label: "Total Gross Revenue"
    description: "Total price of completed sales."
    filters: [
      l_orderstatus: "F"
    ]
  }

  measure: total_cost {
    type: sum
    sql: ${l_supplycost} ;;
    value_format: "$#,##0.00,,\" M\""
    label: "Total Cost"
    description: "Total Cost."
  }

  measure: total_gross_margin_amount {
    type: number
    sql: ${total_gross_revenue} - ${total_cost} ;;
    value_format: "$#,##0.00,,\" M\""
    label: "Total Gross Margin Amount"
    description: "Total Gross Revenue – Total Cost."
  }

  measure: total_margin_percentage {
    type: number
    sql: ${total_gross_margin_amount}/${total_gross_revenue} ;;
    value_format: "0.00%"
    label: "Gross Margin Percentage"
    description: "Total Gross Margin Amount / Total Gross Revenue."
  }

  measure: number_of_item_returned {
    type: sum
    sql: ${l_quantity} ;;
    value_format: "#,##0.00,,\" K\""
    label: "Number of Items Returned"
    description: "Number of items that were returned by dissatisfied customers."
    filters: [
      l_returnflag: "R"
    ]
  }

  measure: total_number_of_item_sold {
    type: sum
    sql: ${l_quantity} ;;
    value_format: "#,##0.00,,\" K\""
    label: "Total Number of Items Sold"
    description: "Number of items that were sold."
  }

  measure: item_return_rate {
    type: number
    sql: ${number_of_item_returned}/${total_number_of_item_sold} ;;
    value_format: "0.00%"
    label: "Item Return Rate"
    description: "Number Of Items Returned / Total Number Of Items Sold."
  }

  measure: total_number_of_customers {
    type: count_distinct
    sql: ${l_custkey} ;;
    value_format: "#,##0"
    label: "Total Number of Customers"
    description: "Number of Customers that placed orders."
  }

  measure: avg_spend_per_customer {
    type: number
    sql: ${total_sale_price}/${total_number_of_customers} ;;
    value_format: "$#,##0.00,,\" M\""
    label: "Average Spend per Customer"
    description: "Total Sale Price / Total Number of Customers."
  }
}
