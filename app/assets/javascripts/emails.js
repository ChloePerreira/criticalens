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


  function deleteEmail(button_clicked, id) {
    $.ajax("/delete-email", {
      type: "DELETE",
      data: {
        id: id,
      },
      success: function (data) {
        button_clicked.addClass("disabled")
        $(".unsub-body").html("You have been successfully unsubscribed!");
      }
    });
  };

  $("body").on("click", "#emailSubmit", function(){
    submitEmail($(this), $(this).attr('userid'));
  });


  $("body").on("click", "#emailDelete", function(){
    deleteEmail($(this), $(this).attr('userid'));
  });

});
