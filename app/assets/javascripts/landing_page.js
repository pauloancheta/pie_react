$(document).ready(function(){
  $('a#create_account').on('click', function(){
    $('.sign_in_form').hide();
    $('.new_user_form').fadeIn();
  })

  $('a#sign_in').on('click', function(){
    $('.new_user_form').hide();
    $('.sign_in_form').fadeIn();
  })
})