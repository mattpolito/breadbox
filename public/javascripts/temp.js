jQuery.noConflict();
(function($) { 
  $(function() {
    $(document).ready(function()  {
      // Toggles editing tools for user in all users list
      $("#all_users .user").toggle(
          function () {
            $(this).next(".edit").show(); // selectes the edit row directly under the user row
          },
          function () {
            $(this).next(".edit").hide();
          }
        );
      // Swap Value in input fields
      // If used elsewhere, this may need to be changed, it's catered to the login at the moment.
      swapValues = [];
      if ($("#test").text() != "Email")
        {
          false;
        }
      else
        {
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
        }
      
    });
  });
})(jQuery);
