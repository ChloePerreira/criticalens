$(document).ready(function(){

  //on click of button
  //if html is "Show critiques"
    //change text to hide critiques
    //run remove hidden function
  //else 
    //change text to "Show critiques"
    //run add hidden function
  
  $(".display-critiques-button").click(function(){
    if( $(this).html() === "Show critiques"){
      $(this).html("Hide critiques");
      remove_hidden_from_divs();
    }else {
      $(this).html("Show critiques");
      add_hidden_to_divs();
    }
  });

  function remove_hidden_from_divs (){
    var critique_divs = $(".each-critique-display")
    for(var i = 0; i<critique_divs.length; i++){
      $(critique_divs[i]).removeClass("hidden");
    }
  };

   function add_hidden_to_divs (){
    var critique_divs = $(".each-critique-display")
    for(var i = 0; i<critique_divs.length; i++){
      $(critique_divs[i]).addClass("hidden");
    }
  };
  
});
