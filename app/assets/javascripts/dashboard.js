/*jQuery(document).ready(function() {
  $(".submit-photo").click(function(e) {
    e.preventDefault();
    alert("blah");
  });
});*/

$(function () {


  function is_exif_avail (photo_id) {
    /*go to url*/
    function process_exif_data (data) {
      /*take out extra flickr stuff jsonFlickrApi( and )*/
      var fixed = data.replace('jsonFlickrApi(', '');
      fixed = fixed.substring(0, fixed.length-1);
      var new_data = JSON.parse(fixed);
      debugger
      return new_data.stat === "ok"
    }; 

    $.ajax({
      url: ("https://api.flickr.com/services/rest/?&method=flickr.photos.getexif"
            + "&api_key=968d29ded344be70d2cd2bda8cfb9820&photo_id="
            + photo_id 
            + "&format=json"),
      success: process_exif_data,
      dataType: "text",
      error: function (e) {console.log(e); alert("there was error");}
    });
    //get data
    //return false if data is not there
    //return data as params if it is there
  };

  $(".submit-photo").click(function (e) {
    e.preventDefault();
    alert("blah");
    var photo_data = $(this).attr('info');
    var photo_id = JSON.parse(photo_data).id;

    console.log(is_exif_avail(photo_id));

    if (is_exif_avail(photo_id, postToTestOnSuccess, complainOnError)) {

      $.ajax("/test", {
          type: "POST",
          data: {hash: photo_data},
          success: function (data) {
          }
      });

    }

  });


});
