view: d_dates {
  sql_table_name: "DATA_MART"."D_DATES" ;;

  dimension_group: date_val {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_VAL" ;;
    label: "Date"
  }
  dimension: datekey {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."DATEKEY" ;;
  }
  dimension: day_number {
    type: number
    sql: day(${TABLE}."DATE_VAL") ;;
    label: "Day of Month"
  }
  dimension: day_of_week {
    type: number
    sql: ${TABLE}."DAY_OF_WEEK" ;;
    label: "Day of Week"
  }
  dimension: dayname_of_week {
    type: string
    sql: ${TABLE}."DAYNAME_OF_WEEK" ;;
    label: "Dayname of Week"
  }
  dimension: month_name {
    type: string
    sql: ${TABLE}."MONTH_NAME" ;;
    label: "Month Name"
  }
  dimension: month_num {
    type: number
    sql: ${TABLE}."MONTH_NUM" ;;
    label: "Month Number"
  }
  dimension: quarter {
    type: number
    sql: ${TABLE}."QUARTER" ;;
    label: "Quarter"
  }
  dimension: year {
    type: number
    sql: ${TABLE}."YEAR" ;;
    label: "Year"
  }
  measure: count {
    type: count
    drill_fields: [month_name]
    label: "Date Count"
  }

  dimension: date_date {
    datatype: date
    sql: ${TABLE}."DATE_VAL" ;;
    hidden: yes
  }

  parameter: p_date_type {
    type: unquoted
    label: "Date Type"
    allowed_value:{
      value: "Year"
      label: "Year"
    }
    allowed_value:{
      value: "Quarter"
      label: "Quarter"
    }
    allowed_value: {
      value: "Month"
      label: "Month"
    }
    allowed_value:{
      value: "Day"
      label: "Day"
    }
  }

  dimension: d_date_type {
    type: number
    label_from_parameter: p_date_type
    sql: {% parameter p_date_type %} ${date_date} ;;
    label: "Dynamic Date"
  }

  dimension: dynamic_chart_name {
    label_from_parameter: p_date_type
    type: string
    sql: {% if p_date_type._parameter_value=="Year" %} 'Gross Margin Yearly Trend'
        {% elsif p_date_type._parameter_value=="Quarter" %} 'Gross Margin Quarterly Trend'
        {% elsif p_date_type._parameter_value=="Month" %} 'Gross Margin Monthly Trend'
        {% elsif p_date_type._parameter_value=="Day" %} 'Gross Margin Daily Trend'
        {% endif %};;
  }
}
