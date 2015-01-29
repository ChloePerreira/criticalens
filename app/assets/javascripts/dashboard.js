/*jQuery(document).ready(function() {
  $(".submit-photo").click(function(e) {
    e.preventDefault();
    alert("blah");
  });
});*/

$(function () {
  $(".submit-photo").click(function (e) {
    e.preventDefault();
    alert("blah");

    $.ajax("/test", {
      type: "POST",
      success: function (data) {
        div.addClass("chosen")
      }
    });

  });
});
