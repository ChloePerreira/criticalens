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
      var id = form_divs[i].id
      var hint_thing = $("#"+$(".test-slider").id+"-hint")
      console.log(id)
      console.log($("#" + id + "-hint")[0].html)
      $(".test-slider").slider({
        value: 1,
        min: 0,
        max: 4,
        step: 1,
        slide: function(event, ui) {
          $("#test").html(stuff[ui.value]);
        }
      }); 
      $("#test").html(stuff[$(".test-slider").slider("value")]);
    };

  });


  function find_nearest (array, val) {
    var nearest = -1
    var bestDist = 1000
    var d = 1000
    for (var i = 0; i < array.length; i++){
      if (array[i] === val) {
        return array[i];}
      else {
        d = Math.abs(val - array[i]);
        if (d < bestDist) {
          nearest = array[i]
          bestDist = d
        }
      }
    }
    return nearest;
  };

});
