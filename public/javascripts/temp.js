jQuery.noConflict();
(function($) { 
  $(function() {
    $(document).ready(function()  {
      $("#all_users .user").toggle(
          function () {
            $(this).next(".edit").show();
          },
          function () {
            $(this).next(".edit").hide();
          }
        );
      // Swap Value in input fields
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
  });
})(jQuery);
