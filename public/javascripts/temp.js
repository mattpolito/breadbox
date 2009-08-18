jQuery.noConflict();
(function($) { 
  $(function() {
    $(document).ready(function()  {
      $("table tbody tr:odd").addClass("striped");
      $(".checkbox").click(function(){
        $(".tools").slideDown("fast")
        $(this).parents(".client").addClass("selected")
      });
    });
  });
})(jQuery);
