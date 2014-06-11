
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
        tag.html(data).dialog({modal: false, width: '32em', draggable: true, resizable: false, maxHeight: 500, position: { my: "left top", at: "right+20 top", of: '#main_menu'}
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
  var tag = $("<div id=" + id + " class='sitewindow'></div>");
  var howmanyopen = $('.sitewindow').length - 1;
  if ($("#" +id).dialog( "isOpen" )===true) {

    $("#" +id).dialog("close");
    $("#" + id).remove();
    $('#' + id + "_menu").css('color', 'red');
    $('#' + id + "_menu").hover(function() {
          $(this).css('color', 'red'); 
       },  function() {
      $(this).css('color', 'red');
   });
  } else {
    if (id == 'siteindex' || id == 'artistindex') {
      $.ajax({
        url: url,
        success: function(data) {
          tag.html(data).dialog({modal: false, resizable: false, width: '23em', draggable: true,  maxHeight: 500, position: { my: "left top", at: "left+" + (10 + (10 * howmanyopen)) + " bottom+" + (20 + (10 * howmanyopen)), of: '#main_menu'}
        }).dialog('open');
        $('#' + id + "_menu").css('color', 'red');
          $('.ui-dialog-titlebar button').click(function() {
            $('#main_menu a').css('color', "#000");
            $("#" + id).remove();
            clearAllMarkers();          
          });
        }
      }); 
    } else {
      $.ajax({
        url: url,
        success: function(data) {
          tag.html(data).dialog({modal: false, resizable:false, dialogClass: 'grey', width: '23em', draggable: true,  maxHeight: 500, position: { my: "right top", at: "right-" + (85 + (10 * howmanyopen)) + " top+" + (25 + (10 * howmanyopen)), of: '#inretreat_header'}
        }).dialog('open');
        $('#' + id + "_menu").css('color', 'red');
          $('.ui-dialog-titlebar button').click(function() {
            $('#main_menu a').css('color', "#000"); 
            $("#" + id).remove(); 
            clearAllMarkers();        
          });
        }
      }); 
    }
  }
}


function clearAllMarkers() {
  var baseImage = {
        url: "/assets/white_dot.png",
        size: new google.maps.Size(24, 24),
        scaledSize: new google.maps.Size(24, 24),
        anchor: new google.maps.Point(8, 8)
      };
  $.each(allMarkers, function(m, mm) {
    
    mm.setIcon(baseImage);
  });
}


