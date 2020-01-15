$(function(){
  $('#email').on('change',function() {
    if ($('#email').val()) {
      $('#hidden_email').val("");
      $('#hidden_password').val("");
    }
  });
});