$(document).ready(function(){

  $.ajax({
    dataType: "json",
    url: ("/test_api"),
    success: function (response){
      console.log(response);
      console.log(response.stuff);
    }
  });


});
