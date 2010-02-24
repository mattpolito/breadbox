$(document).ready(function() {
  $('#payment').click(function(event) {
    event.preventDefault();
    $.ajax({
      url: $(this).attr('href') + '.js',
      cache: false,
      dataType: 'html',
      success: function(html) {
       $('#payment_form').append(html).show()
      }
    });
  });
  
  var $payment_form = $('#payment_form form');
  $payment_form.submit(function(event) {
    event.preventDefault();
    $.post($payment_form.attr('action') + '.js', $payment_form.serialize(), function() {
      $payment_form.hide();
    });
  });
});