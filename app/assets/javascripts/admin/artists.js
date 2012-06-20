$(function(){
  $("table.artists tbody").sortable({
     update: function(event, ui) {
       var tr = ui.item;
       var position = tr.index() + 1;
       var artistId = tr.attr("artist-id");
       var url = $(this).attr('update-order-url');
       url = url.replace("ARTIST_ID", artistId).replace("POSITION", position);
       $.ajax({
         type: 'put',
         url: url
        });
     }
  });
})