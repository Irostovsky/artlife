$(function(){
  $("table.sortable tbody").sortable({
     update: function(event, ui) {
       var tr = ui.item;
       var position = tr.index() + 1;
       var sortableId = tr.attr("sortable-id");
       var url = $(this).attr('update-order-url');
       url = url.replace("SORTABLE_ID", sortableId).replace("POSITION", position);
       $.ajax({
         type: 'put',
         url: url
        });
     }
  });

  $(".toggle_sorting").click(function(){
    var sortable = $(this).parents('table').find('tbody');
    if($(this).hasClass('btn-success')){
      sortable.sortable("disable");
      $(this).removeClass('btn-success').addClass('btn-danger');
    }else{
      sortable.sortable("enable");
      $(this).removeClass('btn-danger').addClass('btn-success');
    }
    return false;
  });

  $(".audios .toggle_sorting").click();
})