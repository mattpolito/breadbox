$(document).ready(function() {
  // Add a new client option to clients dropdown
  $('<option value="new_client">Add A New Client</option>')
    .appendTo('#invoice_client_id')
  // $('option[value=new_client]').select(function(event) {
  //   alert("ADD NEW CLIENT");
  // });
});