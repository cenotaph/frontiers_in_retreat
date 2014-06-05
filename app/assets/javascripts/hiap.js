
function toggleDialog(url, id) {
  var tag = $("<div id=" + id + "></div>");
  if ($("#" +id).dialog( "isOpen" )===true) {

    $("#" +id).dialog("close");
    $("#" + id).remove();
    $('#' + id + "_menu").css('color', '#999');
    $('#' + id + "_menu").hover(function() {
          $(this).css('color', 'red'); 
       },  function() {
      $(this).css('color', '#999');
   });
  } else {
    $.ajax({
      url: url,
      success: function(data) {
        tag.html(data).dialog({modal: false, width: '32em', draggable: true,  maxHeight: 500, position: { my: "left top", at: "right+20 top", of: '#main_menu'}
      }).dialog('open');
      $('#' + id + "_menu").css('color', '#000');
        $('.ui-dialog-titlebar button').click(function() {
          $('#main_menu a').css('color', "#999");          
        });
      }
    });  
  }
}

function siteDialog(url, id) {
  var tag = $("<div id=" + id + " class='sitewindow'></div>");
  var howmanyopen = $('.sitewindow').length - 1;
  if ($("#" +id).dialog( "isOpen" )===true) {

    $("#" +id).dialog("close");
    $("#" + id).remove();
    $('#' + id + "_menu").css('color', '#999');
    $('#' + id + "_menu").hover(function() {
          $(this).css('color', 'red'); 
       },  function() {
      $(this).css('color', '#999');
   });
  } else {
    if (id == 'siteindex') {
      $.ajax({
        url: url,
        success: function(data) {
          tag.html(data).dialog({modal: false, resizable: false, width: '23em', draggable: true,  maxHeight: 500, position: { my: "left top", at: "left bottom+20", of: '#main_menu'}
        }).dialog('open');
        $('#' + id + "_menu").css('color', '#000');
          $('.ui-dialog-titlebar button').click(function() {
            $('#main_menu a').css('color', "#999");
            $("#" + id).remove();          
          });
        }
      }); 
    } else {
      $.ajax({
        url: url,
        success: function(data) {
          tag.html(data).dialog({modal: false, resizable:false, width: '23em', draggable: true,  maxHeight: 500, position: { my: "right top", at: "right-" + (100 + (10 * howmanyopen)) + " top+" + (25 + (10 * howmanyopen)), of: '#inretreat_header'}
        }).dialog('open');
        $('#' + id + "_menu").css('color', '#000');
          $('.ui-dialog-titlebar button').click(function() {
            $('#main_menu a').css('color', "#999"); 
            $("#" + id).remove();         
          });
        }
      }); 
    }
  }
}