$(document).ready(function(){


function submitEmail(button_clicked, id) {
    $.ajax("/submit-email", {
      type: "POST",
      data: {
        id: id,
        email: $("#subscribeEmail").val()
      },
      success: function (data) {
        button_clicked.addClass("disabled")
      }
    });
  };

  $("body").on("click", "#emailSubmit", function(){
    submitEmail($(this), $(this).attr('userid'));
  });

});
