$(function() {
  $('#fileupload').fileupload({
      dataType: 'script',
  }).bind('fileuploadstart', function (e) {
    $(".loading_photo").show();
    $('.errors').empty();
  }).bind('fileuploadstop', function (e) {
    $(".loading_photo").hide();
  });
  
});
