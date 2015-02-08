$(document).ready(function(){

 // Get the aperture data

  if ($("#aperture_chart").length) {
    console.log("ap");
    var photo_id = $("#aperture_chart").attr("photo_id");

    if (photo_id > 0) {

      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(ap_drawChart);

      function ap_drawChart() {

        var photo_id = $("#aperture_chart").attr("photo_id");

        $.ajax({
        dataType: "json",
        url: ("/aperture_tally/"+photo_id),
        success: function (response){
            console.log(response);
            var too_wide = response.too_wide
            var too_narrow = response.too_narrow
            var just_right = response.just_right

            var data = google.visualization.arrayToDataTable([
              ["Rank", "Critiques", { role: "style" } ],
              ["Too narrow", too_narrow, "red"],
              ["Just right", just_right, "green"],
              ["Too wide", too_wide, "blue"]
            ]);


            var options = {
              title: "Critiques on aperture",
              width: 300,
              height: 300,
              bar: {groupWidth: "95%"},
              legend: { position: "none" },
              vAxis: {minValue: 100}
            
            };

            var chart = new google.visualization.ColumnChart(document.getElementById("aperture_chart"));
            chart.draw(data,options);
          }
        });
      }
    }
  }


  //Same for shutter speed


  if ($("#shutter_chart").length) {

    var photo_id = $("#shutter_chart").attr("photo_id");

    if (photo_id > 0) {

      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);

      function drawChart() {

        var photo_id = $("#shutter_chart").attr("photo_id");

        $.ajax({
        dataType: "json",
        url: ("/shutter_tally/"+photo_id),
        success: function (response){
            console.log(response);
            var too_slow = response.too_slow
            var too_fast = response.too_fast
            var just_right = response.just_right

            var data = google.visualization.arrayToDataTable([
              ["Rank", "Critiques", { role: "style" } ],
              ["Too slow", too_slow, "red"],
              ["Just right", just_right, "blue"],
              ["Too fast", too_fast, "green"]
            ]);


            var options = {
              title: "Critiques on shutter",
              width: 300,
              height: 300,
              bar: {groupWidth: "95%"},
              legend: { position: "none" },
              vAxis: {minValue: 100}
            
            };

            var chart = new google.visualization.ColumnChart(document.getElementById("shutter_chart"));
            chart.draw(data,options);
          }
        });
      }
    }
  }
});


