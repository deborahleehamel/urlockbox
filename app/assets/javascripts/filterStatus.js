$(document).ready(function() {


  $("#link_filter_status").on('change', function() {
    var $links = $('.link');
    var filterChoice = this.value;
    $links.each(function(index, link) {
      $link = $(link);
      if ( $link.data("status") === filterChoice) {
        $link.show();
      } else if ( filterChoice === "All" ){
        $link.show();
      } else {
        $link.hide();
      }
    });
  });

});
