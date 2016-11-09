$(document).ready(function() {

  $("#search-box").on("keyup", function() {
    var allSearch = this.value.toLowerCase();
    var $links = $('.link');
    $links.each(function(index, link) {
      $link = $(link);
      if ( $link.children(".link-title").text().toLowerCase().indexOf(allSearch) !== -1 ) {
        $link.show();
      } else if ( $link.children(".link-url").text().toLowerCase().indexOf(allSearch) !== -1 ){
        $link.show();
      }
      else {
        $link.hide();
      }
    });
  });

});
