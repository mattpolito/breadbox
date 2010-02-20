$(document).ready(function(){
  $('.swap_value').each(function(index){
    fieldHighlight(this);
  });
	$(".swap_value").keyup(function(){
    fieldHighlight(this);
  });
});

function fieldHighlight(element){
	if($(element).val() != ""){
		$(element).css({ color:"#FFF"});
		$(element).siblings("label").css({ color:"#FFF"});
	} else {
		$(element).css({ color:"#444"});
		$(element).siblings("label").css({ color:"#444"});
	};
}