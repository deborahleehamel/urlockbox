function updateStatus(id, direction) {
  $.ajax({
    method: "PATCH",
    url: "/api/v1/links/" + id,
    data: { id: id, read: direction},
    success: function(){
      console.log("Holy cow");
      if(direction === true) {
        $("#read-" + id).hide();
        $("#unread-" + id).show();
      } else {
        $("#unread-" + id).hide();
        $("#read-" + id).show();
      }
    }
  });
}
