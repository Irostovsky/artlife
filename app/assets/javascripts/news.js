$(function(){
  
  $(".news_event a.read_more").click(function(){
    $(this).parents(".preview").hide();
    $(this).parents(".news_event").find('.full_text').show();
    return false;
  });
});