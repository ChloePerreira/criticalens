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
        $(".modal-body-email").html("You have been successfully subscribed!");
        $(".modal-body-email").css("text-align", "center");
      }
    });
  };

  $("body").on("click", "#emailSubmit", function(){
    submitEmail($(this), $(this).attr('userid'));
  });

});
