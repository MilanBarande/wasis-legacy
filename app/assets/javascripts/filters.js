$(document).ready(function() {
  $('.button-black').click(function(event){
    event.preventDefault();
    $(this).toggleClass('active');
  });
});

