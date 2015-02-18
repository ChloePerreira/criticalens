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

//all critiques received and given
  if ($("#critiques-chart").length) {

    var user_id = $("#critiques-chart").attr("uid");
    console.log("this should be a number: "+ user_id);
    console.log($("#critiques-chart"));

    if (user_id > 0) {

      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(critique_drawChart);

      function critique_drawChart() {

        var data = new google.visualization.DataTable();

        $.ajax({
          dataType: "json",
          url: ("/critiques_received_and_given/"+user_id),
          success: function (response){
            var given = response.given;
            var received = response.received;
            var name = response.user;
            console.log("The date "+given[0][0]+given[0][1]+received[0][1]);            

            data.addColumn('date', 'X');
            data.addColumn('number', 'Given');
            data.addColumn('number', 'Received');
            data.addRows([
              [new Date(given[0][0]), given[0][1], received[0][1]],
              [new Date(given[1][0]), given[1][1], received[1][1]],
              [new Date(given[2][0]), given[2][1], received[2][1]],
              [new Date(given[3][0]), given[3][1], received[3][1]],
              [new Date(given[4][0]), given[4][1], received[4][1]],
              [new Date(given[5][0]), given[5][1], received[5][1]],
              [new Date(given[6][0]), given[6][1], received[6][1]],
              [new Date(given[7][0]), given[7][1], received[7][1]],
              [new Date(given[8][0]), given[8][1], received[8][1]],
              [new Date(given[9][0]), given[9][1], received[9][1]],
              [new Date(given[10][0]), given[10][1], received[10][1]],
              [new Date(given[11][0]), given[11][1], received[11][1]],
              [new Date(given[12][0]), given[12][1], received[12][1]],
              [new Date(given[13][0]), given[13][1], received[13][1]],
              [new Date(given[14][0]), given[14][1], received[14][1]],
              [new Date(given[15][0]), given[15][1], received[15][1]],
              [new Date(given[16][0]), given[16][1], received[16][1]],
              [new Date(given[17][0]), given[17][1], received[17][1]],
              [new Date(given[18][0]), given[18][1], received[18][1]],
              [new Date(given[19][0]), given[19][1], received[19][1]],
              [new Date(given[20][0]), given[20][1], received[20][1]],
              [new Date(given[21][0]), given[21][1], received[21][1]],
              [new Date(given[22][0]), given[22][1], received[22][1]],
              [new Date(given[23][0]), given[23][1], received[23][1]],
              [new Date(given[24][0]), given[24][1], received[24][1]],
              [new Date(given[25][0]), given[25][1], received[25][1]],
              [new Date(given[26][0]), given[26][1], received[26][1]],
              [new Date(given[27][0]), given[27][1], received[27][1]],
              [new Date(given[28][0]), given[28][1], received[28][1]],
              [new Date(given[29][0]), given[29][1], received[29][1]],
              [new Date(given[30][0]), given[30][1], received[30][1]]
            ]);

            var options = {
              title: "Critiques during the last month",
              //width: 600,
              height: 300,
              hAxis: {
                format: 'M/d/yy',
                gridlines: {color: 'none', count: 9}
                //slantedText: true
              },
              colors: ['#E27A3F', '#45B29D']
            };

            var chart = new google.visualization.LineChart(document.getElementById('critiques-chart'));
            chart.draw(data, options);
          }
        });
      };
    };
  };

//all apertures for profile page
  if ($("#aperture-chart-all").length > 0) {
    var user_id = $("#aperture-chart-all").attr("uid");

    if (user_id > 0) {

      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(ap_all_drawChart);

      function ap_all_drawChart() {

        $.ajax({
        dataType: "json",
        url: ("/aperture_tally_all/"+user_id),
        success: function (response){
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
              title: "Aperture habits",
              //width: 300,
              //height: 300,
              bar: {groupWidth: "95%"},
              legend: { position: "none" },
              vAxis: {title: "% of critiques", minValue: 100}
            };

            var chart = new google.visualization.ColumnChart(document.getElementById("aperture-chart-all"));
            chart.draw(data,options);
          }
        });
      }
    }
  }


//all shutter for profile page
  if ($("#shutter-chart-all").length > 0) {
    var user_id = $("#shutter-chart-all").attr("uid");

    if (user_id > 0) {

      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(sh_all_drawChart);

      function sh_all_drawChart() {

        $.ajax({
        dataType: "json",
        url: ("/shutter_tally_all/"+user_id),
        success: function (response){
            var too_fast = response.too_fast
            var too_slow = response.too_slow
            var just_right = response.just_right

            var data = google.visualization.arrayToDataTable([
              ["Critiques", "Percentage", { role: "style" } ],
              ["Too slow", too_slow, "#EFC94C"],
              ["Just right", just_right, "#45B29D"],
              ["Too fast", too_fast, "#E27A3F"]
            ]);


            var options = {
              title: "Shutter speed habits",
              //width: 300,
              //height: 300,
              bar: {groupWidth: "95%"},
              legend: { position: "none" },
              vAxis: {title: "% of critiques", minValue: 100}
            };

            var chart = new google.visualization.ColumnChart(document.getElementById("shutter-chart-all"));
            chart.draw(data,options);
          }
        });
      }
    }
  }


//all iso for profile page
  if ($("#iso-chart-all").length > 0) {
    var user_id = $("#iso-chart-all").attr("uid");

    if (user_id > 0) {

      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(iso_all_drawChart);

      function iso_all_drawChart() {

        $.ajax({
        dataType: "json",
        url: ("/iso_tally_all/"+user_id),
        success: function (response){
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
              title: "ISO habits",
              //width: 300,
              //height: 300,
              bar: {groupWidth: "95%"},
              legend: { position: "none" },
              vAxis: {title: "% of critiques", minValue: 100}
            };

            var chart = new google.visualization.ColumnChart(document.getElementById("iso-chart-all"));
            chart.draw(data,options);
          }
        });
      }
    }
  }

});


