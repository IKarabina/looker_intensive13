view: d_part {
  sql_table_name: "DATA_MART"."D_PART" ;;

  dimension: p_brand {
    type: string
    sql: ${TABLE}."P_BRAND" ;;
    label: "Brand"
  }
  dimension: p_mfgr {
    type: string
    sql: ${TABLE}."P_MFGR" ;;
    label: "MFGR"
  }
  dimension: p_name {
    type: string
    sql: ${TABLE}."P_NAME" ;;
    label: "Name"
  }
  dimension: p_partkey {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."P_PARTKEY" ;;
  }
  dimension: p_size {
    type: number
    sql: ${TABLE}."P_SIZE" ;;
    label: "Size"
  }
  dimension: p_type {
    type: string
    sql: ${TABLE}."P_TYPE" ;;
    label: "Type"
  }
  measure: count {
    type: count
    drill_fields: [p_name]
    label: "Part Count"
  }
}
