$(document).ready(function () {


  function generate_slider (name_of_slider_divs, array_of_options, bound_attr, default_value_attr) {
    var steps = array_of_options
    var form_divs = $("."+name_of_slider_divs+"-slider")

    //loop over all of the sliders
     for(var i = 0; i<form_divs.length; i++){
      //give every slider an fid attr
      var id = $(form_divs[i]).attr('fid');
      var bound = $(form_divs[i]).attr(bound_attr);
      var setting_used = $(form_divs[i]).attr(default_value_attr);
      var steps_as_floats = eval(steps);
      var steps_size = (steps.length) - 1
      $("#"+id+"-"+name_of_slider_divs+"-slider").slider({
        value: find_nearest(steps_as_floats, eval(setting_used)),
        min: find_nearest(steps_as_floats, eval(bound)),
        max: steps_size,
        step: 1,
        slide: function(event, ui) {
          //console.log("I am:"+$(this).attr("fid")); 
          $("#"+$(this).attr("fid")+"-"+name_of_slider_divs+"-hint").html(steps[ui.value])
        }
      }); 
      //debugging
      //console.log("id:"+id+"bound:"+bound+"setting:"+setting_used+"size:"+steps_size);
      /*console.log(steps[
        $("#"+id+"-"+name_of_slider_divs+"-slider").slider("value")
      ]);
      console.log(find_nearest(steps_as_floats, eval(setting_used)));*/
      $("#"+id+"-"+name_of_slider_divs+"-hint").html(steps[
        $("#"+id+"-"+name_of_slider_divs+"-slider").slider("value")
      ]);
      
      //make green dot appear at right position
      $("#"+id+"-"+name_of_slider_divs+"-dot").attr('style', 
        $("#"+id+"-"+name_of_slider_divs+"-slider").children().
        attr('style'));

    };

    //use for converting array of strings to array of floats
    function string_to_float (array) {
      holder = [];
      for (var i = 0; i < array.length; i++){
        holder[i] = parseFloat(array[i]);
      }
      return holder;
    };
    
    //use for finding nearest match
    function find_nearest (array, val) {
      var nearest = -1
      var bestDist = 1000.0
      var d = 1000.0
      var index = 0
      for (var i = 0; i < array.length; i++){
        if (eval(array[i]) == val) {
          return i;}
        else {
          d = Math.abs(val - eval(array[i]));
          if (d < bestDist) {
            nearest = array[i];
            var index = i;
            bestDist = d;
          }
        }
      }
      return index;
    };
  };

  //build all the sliders
  var aperture_steps = [
    "0.7", "0.8", "0.9", "1.0", "1.1", "1.2", "1.4", "1.6",
    "1.8", "2", "2.2", "2.5", "2.8", "3.2", "3.5", "4",
    "4.5", "5", "5.6", "6.3", "7.1", "8", "9", "10", "11",
    "13", "14", "16", "18", "20", "22"
  ];

  generate_slider ("aperture", aperture_steps, "maxAp", "apUsed") 

  var exposure_steps = [
    "1/15", "1/20", "1/25", "1/30", "1/40",
    "1/50", "1/60", "1/80", "1/100", "1/125",
    "1/160", "1/200", "1/250", "1/320", "1/400", 
    "1/800", "1/1000", "1/1250", "1/1600", "1/2000", 
    "1/2500", "1/3200", "1/4000", "1/5000", "1/8000"
    ];

  generate_slider ("exposure", exposure_steps, "maxExp", "expUsed") 

  var iso_steps = [
    "100", "125", "160", "200", "250", "320", 
    "400", "500", "640", "800", "1000", "1250", 
    "1600", "2000", "2500", "3200", "4000", "5000", 
    "6400", "8000", "10000", "12500"
  ];
  
  generate_slider ("iso", iso_steps, "maxIso", "isoUsed") 

  //deactivate wb buttons on click if active
  $('body').on('click', '.btn.wb.active', function(e){
    e.preventDefault();
    e.stopImmediatePropagation();
    var id = $(this).attr('fid');
    $(this).removeClass('active');
    $(this).removeClass(id+"-wb");
  });

  //add special class with id-wb if active
  $('body').on('click', '.btn.wb', function(e){
    e.preventDefault();
    var id = $(this).attr('fid');
    $(this).siblings().removeClass(id+"-wb");
    $(this).addClass(id+"-wb");
  });

  //on submit, print the values
  $(".submit-critique").click(function(){
    var id = $(this).attr('fid');
    form = [
      $(this).attr('session'),
      $("#"+id+"-aperture-hint").html(),
      $("#"+id+"-exposure-hint").html(),
      $("#"+id+"-iso-hint").html(),
      $($("."+id+"-wb")[0]).attr("wb")
    ];
    console.log(form);
    console.log(id);
  });

});


