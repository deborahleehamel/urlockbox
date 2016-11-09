function updateStatus(id, status) {
  $.ajax({
    method: "PATCH",
    url: "/api/v1/links/" + id,
    data: { id: id, read: status},
    success: function(){
      if(status === true) {
        $("#read-" + id).hide();
        $("#unread-" + id).show();
      } else {
        $("#unread-" + id).hide();
        $("#read-" + id).show();
      }
    }
  });
}
