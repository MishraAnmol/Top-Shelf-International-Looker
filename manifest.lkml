
constant: aud_currency_format {

  value: "<a href=\"#drillmenu\" target=\"_self\">
  {% if value >= 100000000 %}
  ${{ value | divided_by: 1000000.00 | round:0 }}M
  {% elsif value >= 1000000 and value < 100000000 %}
  ${{ value | divided_by: 1000000.00 | round:1 }}M
  {% elsif value >= 1000000 and value < 10000000 %}
  ${{ value | divided_by: 1000000.00 | round:2 }}M
  {% elsif value >= 1000 and value < 1000000 %}
  ${{ value | divided_by: 1000.00 | round:1 }}K
  {% elsif value >= 0 and value < 1000 %}
  ${{ value | round:2 }}
  {% elsif value > -1000.0 and value < 0 %}
  - ${{ value | round:2 | times: -1 }}
  {% elsif value > -1000000 and value <= -1000 %}
  - ${{ value | divided_by: -1000.00 | round:1 }}K
  {% elsif value > -10000000 and value <= -1000000 %}
  - ${{ value | divided_by: -1000000.00 | round:2 }}M
  {% elsif value > -100000000 and value <= -10000000 %}
  - ${{ value | divided_by: -1000000.00 | round:1 }}M
  {% elsif value <= -100000000 %}
  - ${{ value | divided_by: -1000000.00 | round:0 }}M
  {% else %}
  'fail'
  {% endif %}
  </a>"
}


constant: margin_values_format {
   value: "<a href=\"#drillmenu\" target=\"_self\">
  {% if value >= 100000000 %}
  {{ value | divided_by: 1000000.00 | round:0 }}M
  {% elsif value >= 1000000 and value < 100000000 %}
  {{ value | divided_by: 1000000.00 | round:1 }}M
  {% elsif value >= 1000000 and value < 10000000 %}
  {{ value | divided_by: 1000000.00 | round:2 }}M
  {% elsif value >= 1000 and value < 1000000 %}
  {{ value | divided_by: 1000.00 | round:1 }}K
  {% elsif value >= 0 and value < 1000 %}
  {{ value | round:2 }}
  {% elsif value > -1000.0 and value < 0 %}
  - {{ value | round:2 | times: -1 }}
  {% elsif value > -1000000 and value <= -1000 %}
  - {{ value | divided_by: -1000.00 | round:1 }}K
  {% elsif value > -10000000 and value <= -1000000 %}
  - {{ value | divided_by: -1000000.00 | round:2 }}M
  {% elsif value > -100000000 and value <= -10000000 %}
  - {{ value | divided_by: -1000000.00 | round:1 }}M
  {% elsif value <= -100000000 %}
  - {{ value | divided_by: -1000000.00 | round:0 }}M
  {% else %}
  'fail'
  {% endif %}
  </a>"
}
