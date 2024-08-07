view: d_supplier {
  sql_table_name: "DATA_MART"."D_SUPPLIER" ;;

  set: detail {
    fields: [
      s_acctbal_tier
      ,s_region
    ]
  }

  dimension: s_acctbal {
    type: number
    sql: ${TABLE}."S_ACCTBAL" ;;
    label: "Account Balance"
  }

  dimension: s_acctbal_tier {
    type: tier
    tiers: [1, 3001, 5001, 7001]
    style: integer
    sql: ${s_acctbal} ;;
    label: "Cohort of suppliers according to Account Balance"
    description: "Cohort of suppliers according to Account Balance:
    <= 0;
    1—3000;
    3001—5000;
    5001—7000;
    7000 <"
  }

  dimension: s_address {
    type: string
    sql: ${TABLE}."S_ADDRESS" ;;
    label: "Supplier Address"
  }
  dimension: s_name {
    type: string
    sql: ${TABLE}."S_NAME" ;;
    label: "Supplier Name"
    link: {
      label: "Supplier's website"
      url: "https://www.google.com/search?q={{ value | url_encode }}"
      icon_url: "https://google.com/favicon.ico"
    }
  }
  dimension: s_nation {
    type: string
    sql: ${TABLE}."S_NATION" ;;
    label: "Supplier Nation"
  }
  dimension: s_phone {
    type: string
    sql: ${TABLE}."S_PHONE" ;;
    label: "Supplier Phone"
  }
  dimension: s_region {
    type: string
    sql: ${TABLE}."S_REGION" ;;
    label: "Supplier Region"
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
