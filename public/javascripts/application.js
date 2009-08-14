// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function insert_fields(link, method, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + method, "g")
  $$('table#invoice_lines tbody').last().insert({
    bottom : replace_id_of_new_line(link, regexp, new_id, content)
  })
}

function remove_fields(link) {
  var hidden_field = $(link).previous("input[type=hidden]");
  if (hidden_field) {
    hidden_field.value = '1';
  }
  $(link).up(".invoice_line").hide();
}

function replace_id_of_new_line(link, regexp, new_id, content) {
  return content.replace(regexp, new_id)
}
// $(document).ready(function()  {
//   $("table tbody tr:odd").addClass("striped");
// });
