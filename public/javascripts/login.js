$(document).ready(function()  {
  
  if ($("#email").attr("value") == "")
    {
      $("#email").addClass("swap_value").attr("value","Email");
    }
  if ($("#password").attr("value") == "")
    {
      $("#password").addClass("swap_value").attr("value","Password");
    }
    
  // Swap Value
  swapValues = [];
  $(".swap_value").each(function(i){
    swapValues[i] = $(this).val();
    $(this).focus(function(){
      if ($(this).val() == swapValues[i]) {
        $(this).val("").css({ color: "#FFF"});
        $(this).siblings("label").css({ color: "#FFF"});
      }
    }).blur(function(){
      if ($.trim($(this).val()) == "") {
        $(this).val(swapValues[i]).css({ color: "#444"});
        $(this).siblings("label").css({ color: "#444"});
      }
    });
  });
});