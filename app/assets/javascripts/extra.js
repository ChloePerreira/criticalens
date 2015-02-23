$(document).ready(function(){


 /* $(window).load(function(){ 

    //get all of the form columns and make them the same height as the photo column 
    var all_form_divs = $('.whole-form')
    for(var i = 0; i < all_form_divs.length; i++){
      var id = $(all_form_divs[i]).attr('form_id');
      $(all_form_divs[i]).height($($(all_form_divs[i]).siblings()[0]).height());
      console.log("My siblings are:" +
        $($(all_form_divs[i]).siblings()[0]).html() +
        "and their height is" +
        $($(all_form_divs[i]).siblings()[0]).height()
      ) 
    }

  });*/

  $(window).load(function(){
    var sib_height = $(".user-settings").height();
    $(".no-critiques").height(sib_height);
  });

});

