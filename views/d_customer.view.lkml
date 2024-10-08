view: d_customer {
  sql_table_name: "DATA_MART"."D_CUSTOMER" ;;

  dimension: c_address {
    type: string
    sql: ${TABLE}."C_ADDRESS" ;;
    label: "Customer Address"
  }
  dimension: c_custkey {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."C_CUSTKEY" ;;
  }
  dimension: c_mktsegment {
    type: number
    sql: ${TABLE}."C_MKTSEGMENT" ;;
    label: "Market Segment"
  }
  dimension: c_name {
    type: string
    sql: ${TABLE}."C_NAME" ;;
    label: "Customer Name"
  }
  dimension: c_nation {
    type: string
    sql: ${TABLE}."C_NATION" ;;
    label: "Customer Nation"
  }
  dimension: c_phone {
    type: string
    sql: ${TABLE}."C_PHONE" ;;
    label: "Customer Phone"
  }
  dimension: c_region {
    type: string
    sql: ${TABLE}."C_REGION" ;;
    label: "Customer Region"
    html: <a href="/dashboards/304?Customer+Region={{_filters['d_customer.c_region'] | url_encode }}">{{ value }}</a> ;;
  }
  measure: count {
    type: count
    drill_fields: [c_name]
    label: "Customer Count"
  }
}
