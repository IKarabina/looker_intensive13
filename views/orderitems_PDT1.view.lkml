view: orderitems_pdt1 {
  derived_table: {
      explore_source: orderitems {
        column: l_orderkey {}
        column: l_partkey {}
        column: l_orderpriority {}
        column: l_orderstatus {}
        column: l_shipmode {}
        column: l_shippriority {}
        column: l_returnflag {}
        column: total_cost {}
        column: total_sale_price {}
        column: total_gross_revenue {}
        column: total_gross_margin_amount {}
        column: total_number_of_item_sold {}
        column: number_of_item_returned {}
      }
      #datagroup_trigger: daily_datagroup
      #persist_for: "24 hours"
    }
    dimension: l_orderkey {
      label: "Orders Order Key"
      description: ""
      type: number
    }
    dimension: l_partkey {
      label: "Orders Part Key"
      description: ""
      type: number
    }
    dimension: l_orderpriority {
      label: "Orders Order Priotity"
      description: ""
    }
    dimension: l_orderstatus {
      label: "Orders Order Status"
      description: ""
    }
    dimension: l_shipmode {
      label: "Orders Shiping Mode"
      description: ""
    }
    dimension: l_shippriority {
      label: "Orders Shiping Priority"
      description: ""
      type: number
    }
    dimension: l_returnflag {
      label: "Orders Return Flag"
      description: ""
    }
    dimension: total_cost {
      label: "Orders Total Cost"
      description: "Total Cost."
      value_format: "$#,##0.00"
      type: number
    }
    dimension: total_sale_price {
      label: "Orders Total Sale Price"
      description: "Total sales from items sold."
      value_format: "$#,##0.00"
      type: number
    }
    dimension: total_gross_revenue {
      label: "Orders Total Gross Revenue"
      description: "Total price of completed sales."
      value_format: "$#,##0.00"
      type: number
    }
    dimension: total_gross_margin_amount {
      label: "Orders Total Gross Margin Amount"
      description: "Total Gross Revenue – Total Cost."
      value_format: "$#,##0.00"
      type: number
    }
    dimension: total_number_of_item_sold {
      label: "Orders Total Number of Items Sold"
      description: "Number of items that were sold."
      value_format: "#,##0"
      type: number
    }
    dimension: number_of_item_returned {
      label: "Orders Number of Items Returned"
      description: "Number of items that were returned by dissatisfied customers."
      value_format: "#,##0"
      type: number
    }

  measure: m_total_cost {
    label: "Total Cost"
    description: "Total Cost."
    value_format: "$#,##0.00"
    type: sum
    sql: ${total_cost} ;;
  }

  measure: m_total_sale_price {
    label: "Total Sale Price"
    description: "Total sales from items sold."
    value_format: "$#,##0.00"
    type: sum
    sql: ${total_sale_price} ;;
  }

  measure: m_total_gross_revenue {
    label: "Total Gross Revenue"
    description: "Total price of completed sales."
    value_format: "$#,##0.00"
    type: sum
    sql: ${total_gross_revenue} ;;
  }

  measure: m_total_gross_margin_amount {
    label: "Total Gross Margin Amount"
    description: "Total Gross Revenue – Total Cost."
    value_format: "$#,##0.00"
    type: sum
    sql: ${total_gross_margin_amount} ;;
  }

  measure: m_total_number_of_item_sold {
    label: "Total Number of Items Sold"
    description: "Number of items that were sold."
    value_format: "#,##0"
    type: sum
    sql: ${total_number_of_item_sold} ;;
  }

  measure: m_number_of_item_returned {
    label: "Number of Items Returned"
    description: "Number of items that were returned by dissatisfied customers."
    value_format: "#,##0"
    type: sum
    sql: ${number_of_item_returned} ;;
  }
}
