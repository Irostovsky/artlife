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
})