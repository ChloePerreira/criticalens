$(document).ready(function(){
 
  //get all of the form columns and make them the same height as the photo column 
  var all_form_divs = $('.whole-form')
  for(var i = 0; i < all_form_divs.length; i++){
    $(all_form_divs[i]).height($($(all_form_divs[i]).siblings()[0]).height());
  }

});

