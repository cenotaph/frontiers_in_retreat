
function toggleDialog(url, id) {
  var tag = $("<div id=" + id + "></div>");
  if ($("#" +id).dialog( "isOpen" )===true) {

    $("#" +id).dialog("close");
    $("#" + id).remove();
    $('#' + id + "_menu").css('color', 'black');
  } else {
    $.ajax({
      url: url,
      success: function(data) {
        tag.html(data).dialog({modal: false, width: '32em', draggable: true,  maxHeight: 500, position: { my: "left top", at: "right+20 top", of: '#main_menu'}
      }).dialog('open');
      $('#' + id + "_menu").css('color', 'red');
        $('.ui-dialog-titlebar button').click(function() {
          $('#main_menu a').css('color', "#000");          
        });
      }
    });  
  }
}

function siteDialog(url, id) {
  var tag = $("<div id=" + id + "></div>");
  if ($("#" +id).dialog( "isOpen" )===true) {

    $("#" +id).dialog("close");
    $("#" + id).remove();
    $('#' + id + "_menu").css('color', 'black');
  } else {
    $.ajax({
      url: url,
      success: function(data) {
        tag.html(data).dialog({modal: false, width: '23em', draggable: true,  maxHeight: 500, position: { my: "left top", at: "left bottom+20", of: '#main_menu'}
      }).dialog('open');
      $('#' + id + "_menu").css('color', 'red');
        $('.ui-dialog-titlebar button').click(function() {
          $('#main_menu a').css('color', "#000");          
        });
      }
    });  
  }
}