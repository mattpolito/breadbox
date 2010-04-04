$(document).ready(function() {
  // Add a new client option to clients dropdown
  $('<option value="new_client">Add A New Client</option>')
    .appendTo('#invoice_client_id');
    
  $('#invoice_client_id').change(function(event) {
    $('#invoice_client_id option:selected').each(function() {
      if( $(this).val() == 'new_client' ) {
        $.ajax({
          url: '/clients/new.js',
          cache: false,
          dataType: 'html',
          success: function(html) {
           $('#new_client_form').append(html).show();
           ajaxFormBinding();
          }
        });
      }
    });
  });
  
  function ajaxFormBinding() {
    var $client_form = $('#new_client_form form');
    $client_form.submit(function(event) {
      event.preventDefault();
      $.post($client_form.attr('action') + '.js', $client_form.serialize(), function() {
        $client_form.hide();
      });
    }); 
  }

  
  // var $payment_form = $('#payment_form form');
  // $payment_form.submit(function(event) {
  //   event.preventDefault();
  //   $.post($payment_form.attr('action') + '.js', $payment_form.serialize(), function() {
  //     $payment_form.hide();
  //   });
  // });
});