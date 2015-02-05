$(document).ready(function(){
 
  //get all of the form columns and make them the same height as the photo column 
  var all_form_divs = $('.whole-form')
  for(var i = 0; i < all_form_divs.length; i++){
    $(all_form_divs[i]).height($($(all_form_divs[i]).siblings()[0]).height());
  }

  //show effect for forms
  $($( ".button-for-form-show" )[0]).click(function() {
    $($( ".toggler" )[0]).show( "clip", 1000 );
  });

  $($("#clip")[0]).hide();
   /* $(function() {
    // run the currently selected effect
    function runEffect() {
 
      // most effect types need no options passed by default
      var options = {};
 
      // run the effect
      $( "#clip" ).show( "clip", options, 500, callback );
    };
 
    //callback function to bring a hidden box back
    function callback() {
      setTimeout(function() {
        $( "#clip:visible" ).removeAttr( "style" ).fadeOut();
      }, 1000 );
    };
 
    // set effect from select menu value
    $( "#button-for-form-show" ).click(function() {
      runEffect();
    });
 
    $( "#clip" ).hide();
  });*/

});

