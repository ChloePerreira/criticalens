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
              ["Critiques", "Percentage", { role: "style" } ],
              ["Too narrow", too_narrow, "#EFC94C"],
              ["Just right", just_right, "#45B29D"],
              ["Too wide", too_wide, "#E27A3F"]
            ]);


            var options = {
              title: "Critiques on aperture",
              //width: 300,
              //height: 300,
              bar: {groupWidth: "95%"},
              legend: { position: "none" },
              vAxis: {title: "% of critiques", minValue: 100}
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
      google.setOnLoadCallback(sh_drawChart);

      function sh_drawChart() {

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
              ["Critiques", "Percentage", { role: "style" } ],
              ["Too slow", too_slow, "#EFC94C"],
              ["Just right", just_right, "#45B29D"],
              ["Too fast", too_fast, "#E27A3F"]
            ]);


            var options = {
              title: "Critiques on shutter",
              //width: 300,
              //height: 300,
              bar: {groupWidth: "95%"},
              legend: { position: "none" },
              vAxis: {title: "% of critiques", minValue: 100}
            
            };

            var chart = new google.visualization.ColumnChart(document.getElementById("shutter_chart"));
            chart.draw(data,options);
          }
        });
      }
    }
  }

  //same for iso

  if ($("#iso_chart").length) {

    var photo_id = $("#iso_chart").attr("photo_id");

    if (photo_id > 0) {

      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(iso_drawChart);

      function iso_drawChart() {

        var photo_id = $("#iso_chart").attr("photo_id");

        $.ajax({
        dataType: "json",
        url: ("/iso_tally/"+photo_id),
        success: function (response){
            console.log(response);
            var too_high = response.too_high
            var too_low = response.too_low
            var just_right = response.just_right

            var data = google.visualization.arrayToDataTable([
              ["Critiques", "Percentage", { role: "style" } ],
              ["Too low", too_low, "#EFC94C"],
              ["Just right", just_right, "#45B29D"],
              ["Too high", too_high, "#E27A3F"]
            ]);


            var options = {
              title: "Critiques on ISO",
              //width: 300,
              //height: 300,
              bar: {groupWidth: "95%"},
              legend: { position: "none" },
              vAxis: {title: "% of critiques", minValue: 100}
            
            };

            var chart = new google.visualization.ColumnChart(document.getElementById("iso_chart"));
            chart.draw(data,options);
          }
        });
      }
    }
  }


  if ($("#critiques-chart").length) {

    var user_id = $("#critiques-chart").attr("uid");
    console.log("this should be a number: "+ user_id);
    console.log($("#critiques-chart"));

    if (user_id > 0) {

      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(critique_drawChart);

      function critique_drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('number', 'X');
        data.addColumn('number', 'Dogs');
        data.addColumn('number', 'Cats');
        data.addRows([
          [0, 0, 80],   [1, 10, 75],  [2, 23, 72],
          [3, 17, 70],  [4, 18, 69],  [5, 9, 68],
          [6, 11, 67],  [7, 27, 65],  [8, 33, 60],
          [9, 40, 64],  [10, 32, 68], [11, 35, 70],
          [12, 30, 75], [13, 40, 73], [14, 42, 72],
          [15, 47, 71], [16, 44, 70], [17, 48, 67],
          [18, 52, 65], [19, 54, 66], [20, 42, 68],
        ]);
        var options = {
          width: 1000,
          height: 563,
          hAxis: {
            title: 'Time'
          },
          vAxis: {
            title: 'Popularity'
          },
          colors: ['#a52714', '#097138']
        };

        var chart = new google.visualization.LineChart(document.getElementById('critiques-chart'));
        chart.draw(data, options);
      }
    }
  }

});


