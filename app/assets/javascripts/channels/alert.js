$(document).ready(function() {
   setTimeout(function() {
     $('.alert').slideUp()
   }, 2000)

   if ($(".alert").text().trim() == "") {
     $(".alert").addClass("hide")
   }
 });
