$(function(){
  $('#place_button').click(function() {
    const input = $('#place').val();

    $.ajax({
      url: '/events/map',
      type: 'GET',
      data: {place: input},
      dataType: 'script'
    })
  });
});