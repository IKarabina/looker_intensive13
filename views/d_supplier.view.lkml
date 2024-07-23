view: d_supplier {
  sql_table_name: "DATA_MART"."D_SUPPLIER" ;;

  dimension: s_acctbal {
    type: number
    sql: ${TABLE}."S_ACCTBAL" ;;
    label: "Account Balance"
  }
  dimension: s_address {
    type: string
    sql: ${TABLE}."S_ADDRESS" ;;
    label: "Address"
  }
  dimension: s_name {
    type: string
    sql: ${TABLE}."S_NAME" ;;
    label: "Name"
  }
  dimension: s_nation {
    type: string
    sql: ${TABLE}."S_NATION" ;;
    label: "Nation"
  }
  dimension: s_phone {
    type: string
    sql: ${TABLE}."S_PHONE" ;;
    label: "Phone"
  }
  dimension: s_region {
    type: string
    sql: ${TABLE}."S_REGION" ;;
    label: "Region"
  }
  dimension: s_suppkey {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."S_SUPPKEY" ;;
  }
  measure: count {
    type: count
    drill_fields: [s_name]
    label: "Supplier Count"
  }
}
