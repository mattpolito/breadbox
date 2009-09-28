$(document).ready(function()  {

  // User Login value set
  $("#user_details input").each(function(){
    if($(this).attr("value") == ""){
      $(this).attr("value", $(this).siblings("label").text());
      $(this).addClass("swap_value");
    }
  });

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