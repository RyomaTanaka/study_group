$(function(){
  let tabs = $('.user_menu_item')

  function tabSwitch(){
    $('.active').removeClass('active');
    $(this).addClass('active')
    const index = tabs.index(this);
    $('.user_show_main-center').addClass('display-none').eq(index).removeClass('display-none');
  }

  tabs.click(tabSwitch);
});