$(document).ready(function(){
  $('.menu-title').on('click', function(){ 
    $(this).siblings('div').slideToggle() 
  })
})