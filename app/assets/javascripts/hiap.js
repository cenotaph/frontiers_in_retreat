function showUrlInDialog(url){
   var tag = $("<div></div>");
   $.ajax({
     url: url,
     success: function(data) {
       tag.html(data).dialog({modal: true, width: '45em', draggable: true, position: { my: "left top", at: "right+20 top", of: '#main_menu'}}).dialog('open');
       $('.ui-dialog-titlebar button').click(function() {
         $('#main_menu a').css('color', "#000");          
       });
     }
   });
 }
 
