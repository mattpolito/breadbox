// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function nospam(user,domain) {
	locationstring = "mailto:" + user + "@" + domain;
	window.location = locationstring;
}

$(function() {
  $('form#new_invoice a.add_child').live('click', function() {
    var assoc   = $(this).attr('data-association');
    var content = $('#' + assoc + '_fields_template').html();
    var regexp  = new RegExp('new_' + assoc, 'g');
    var new_id  = new Date().getTime();

    $('form#new_invoice table tbody tr:last').after(content.replace(regexp, new_id));
    console.log(content);
    console.log(regexp);
    console.log(new_id);
    return false;
  });
  
	$('form a.add_child').live('click', function() {
		var assoc = $(this).attr('data-association');
		var content = $('#' + assoc + '_fields_template').html();
		var regexp = new RegExp('new_' + assoc, 'g');
		var new_id = new Date().getTime();
		
		$(this).parent().before(content.replace(regexp, new_id));
		return false;
	});
	
	$('form a.remove_child').live('click', function() {
	  var hidden_field = $(this).prev('input[type=hidden]')[0];
	  if(hidden_field) {
	    hidden_field.value = '1';
	  }
	  $(this).parent('.fields').hide();
	  return false;
	});
});
