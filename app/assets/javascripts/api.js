$(document).ready(function(){

 // Get the aperture data

  var photo_id = $("#aperture_chart").attr("photo_id");

  if (photo_id > 0) {

    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);

    function drawChart() {

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
              ["Too narrow", too_narrow, "#b87333"],
              ["Just right", too_wide, "gold"],
              ["Too wide", just_right, "color: #e5e4e2"]
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
});


