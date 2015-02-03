$(document).ready(function () {

  //var match = $.inArray(htmlthing, steps);


  $(function() {

    var steps = [
      "0.7", "0.8", "0.9", "1.0", "1.1", "1.2", "1.4", "1.6",
      "1.8", "2", "2.2", "2.5", "2.8", "3.2", "3.5", "4",
      "4.5", "5", "5.6", "6.3", "7.1", "8", "9", "10", "11",
      "13", "14", "16", "18", "20", "22"
    ];

    var stuff = ["this", "doesn't", "work", "right", "why?"];

    var form_divs = $(".test-slider")

    for(var i = 0; i<form_divs.length; i++){
      var id = $(form_divs[i]).attr('fid');
      var maxAp = $(form_divs[i]).attr('maxAp');
      console.log("Maxap as string:"+maxAp+"as float:"+parseFloat(maxAp));
      console.log("array of numbers:"+string_to_float(steps));
      console.log("nearest:"+find_nearest(string_to_float(steps), 4));
      console.log("The maxAp is:" + maxAp + "and the closest thing is" + steps[find_nearest(string_to_float(steps), parseFloat(maxAp))]);
      $("#"+id+"-slider").slider({
        value: 1,
        min: find_nearest(string_to_float(steps), parseFloat(maxAp)),
        max: 30,
        step: 1,
        slide: function(event, ui) {
          //console.log("I am:"+$(this).attr("fid")); 
          $("#"+$(this).attr("fid")+"-hint").html(steps[ui.value])
        }
      }); 
      
      $("#"+id+"-hint").html(stuff[$("#"+id+"-slider").slider("value")]);
    };

  });

  function string_to_float (array) {
    holder = [];
    for (var i = 0; i < array.length; i++){
      holder[i] = parseFloat(array[i]);
    }
    return holder;
  }

  function find_nearest (array, val) {
    var nearest = -1
    var bestDist = 1000
    var d = 1000
    var index = 0
    for (var i = 0; i < array.length; i++){
      if (array[i] === val) {
        return i;}
      else {
        d = Math.abs(val - array[i]);
        if (d < bestDist) {
          nearest = array[i]
          var index = i;
          bestDist = d;
        }
      }
    }
    return index;
  };

});
