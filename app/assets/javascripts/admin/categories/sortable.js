$(function(){
  $("table.categories tbody").sortable({
     update: function(event, ui) {
       var tr = ui.item;
       var position = tr.index() + 1;
       var categoryId = tr.attr("category-id");
       var url = $(this).attr('update-order-url');
       url = url.replace("CATEGORY_ID", categoryId).replace("POSITION", position);
       $.ajax({
         type: 'put',
         url: url
        });
     }
  });
})