$(document).ready(function(){

 // Get the aperture data
  var photo_id = $("#aperture_chart").attr("photo_id");
  
  $.ajax({
    dataType: "json",
    url: ("/aperture_tally/"+photo_id),
    success: function (response){
      console.log(response);
      var too_wide = response.too_wide
      var too_narrow = response.too_narrow
      var just_right = response.just_right





    }
  });

  

});
