
$(function () {


  function check_is_exif_avail (photo_id, onSuccess, onError) {


    $.ajax({
      url: ("https://api.flickr.com/services/rest/?&method=flickr.photos.getexif"
            + "&api_key=968d29ded344be70d2cd2bda8cfb9820&photo_id="
            + photo_id 
            + "&format=json"),
      success: process_exif_data,
      dataType: "text", /*forced data type to be text else jquery prematurely interprets as json*/
      error: function (e) {alert("There was error");}
    });

  };

  /*click handler*/
  $(".submit-photo").click(function (e) {
    e.preventDefault();
    var photo_data = $(this).attr('info');
    var photo_id = JSON.parse(photo_data).id;


    function postToTestOnSuccess () {    
      $.ajax("/test", {
        type: "POST",
        data: {hash: photo_data},
        success: function (data) {
        }
      });
    }

    function complainOnError () {
      alert("Please make sure Exif data is publicly available");
    }

    check_is_exif_avail(photo_id, postToTestOnSuccess, complainOnError);
  });



  function process_exif_data (flickr_api_response) {
    /*get rid of flickr junk*/
    var fixed = flickr_api_response.replace('jsonFlickrApi(', '');
    fixed = fixed.substring(0, fixed.length-1);

    var api_response_json = JSON.parse(fixed);
    
    /*stat equals ok if exif avail otherwise equals fail*/
    if (api_response_json.stat === "ok") {
      onSuccess();
    } else {
      onError();
    }
  }; 

});
