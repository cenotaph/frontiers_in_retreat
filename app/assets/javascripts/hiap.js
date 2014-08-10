
function toggleDialog(url, id) {
  var tag = $("<div id=" + id + "></div>");
  if (id == 'news') {
    var w = 640;
  } else {
    var w = 720;
  }
  if ($("#" +id).dialog( "isOpen" )===true) {
    $("#" +id).dialog("close");
    $("#" + id).remove();
    //$('#' + id + "_menu").css('color', '#000');
   //  $('#' + id + "_menu").hover(function() {
   //        $(this).css('color', 'red');
   //     },  function() {
   //    $(this).css('color', '#000');
   // });
  } else {
    $.ajax({
      url: url,
      success: function(data) {
        tag.html(data).dialog({modal: false, width: '32em', stack: true, draggable: true, width: w,  dialogClass: 'white', resizable: false, maxHeight: 700, position: { my: "left top", at: "right+20 top", of: '#main_menu'},       
        close:     function(event, ui) {  
          $("#" + id).remove();
          $('#' + id + "_menu").css('color', '#000');     
        },
        open: function(event,ui) {
          $('#' + id + "_menu").css('color', 'red');   
        }
      }).dialog('open');

      $('.ui-dialog.white').on('click', function( event, ui ) { 

        $(this).css('z-index', parseInt($(this).css( "z-index" )) + 10); });
      }
    });  
  }
}

function siteDialog(url, id, lat, lng) {
  var tag = $("<div id=" + id + " class='sitewindow'></div>");
  var howmanyopen = $('.sitewindow').length - 1;
  if ($("#" +id).dialog( "isOpen" )===true) {
    $("#" +id).dialog("close");
    $("#" + id).remove();
    // $('#' + id + "_menu").hover(function() {
    //       $(this).css('color', '#000');
    //    },  function() {
    //   $(this).css('color', 'red');
   // });
  } else {
    if (id == 'siteindex' || id == 'artistindex') {
      $.ajax({
        url: url,
        success: function(data) {
          tag.html(data).dialog({modal: false, resizable: false, stack: true, dialogClass: 'white', width: '23em', draggable: true,  maxHeight: 700, position: { my: "left top", at: "left+" + (10 + (10 * howmanyopen)) + " bottom+" + (40 + (10 * howmanyopen)), of: '#main_menu'}, 
          close: function(event, ui) {  
            $("#" + id).remove();
            $('#' + id + "_menu").css('color', '#000');
          }, 
          open: function(event, ui) {
            $('#' + id + "_menu").css('color', 'red');
          }
        }).dialog('open');
        
        $('#' + id + "_menu").css('color', 'red');

       $('.ui-dialog.white').on('click', function( event, ui ) { 
         $(this).css('z-index', parseInt($(this).css( "z-index" )) + 10); } ); 
      
        }
      }); 
    }
     else {
      $.ajax({
        url: url,
        success: function(data) {
          tag.html(data).dialog({modal: false, resizable:false, stack: true, dialogClass: 'grey', width: '23em', draggable: true,  maxHeight: 600, position: { my: "right top", at: "right-" + (85 + (10 * howmanyopen)) + " top+" + (25 + (10 * howmanyopen)), of: '#inretreat_header'}, 
          open: function(event, ui) {
            if (lat != 0) {
              $(this).attr('lat', lat );
              $(this).attr('lng', lng );
            }
          },
          close: function(event, ui) {  
            $("#" + id).remove();
            if (lat != 0) {
              clearAllMarkers();   
            }
          }
        }).dialog('open');
        if (lat != 0) {
          zoomAndSetMarker(lat, lng);
        }

        $('#' + id + "_menu").css('color', 'red');
        $('.ui-dialog-titlebar button').click(function() {
          $('#' + id + "_menu").css('color', '#000');


        });
        
        
        $('.grey').on('click', function( event, ui ) { 
          $(this).css('z-index', parseInt($(this).css( "z-index" )) + 10); 
          if ($(this).children('.sitewindow').attr('lat') != undefined) {
            zoomAndSetMarker($(this).children('.sitewindow').attr('lat'), $(this).children('.sitewindow').attr('lng'));
          }
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
  return false;
}

function zoomAndSetMarker(lat, lng) {
 
    clearAllMarkers();   
  var hoverImage = {
        url: "/assets/red_dot.png",
        size: new google.maps.Size(24, 24),
        scaledSize: new google.maps.Size(24, 24),
        anchor: new google.maps.Point(8, 8)
      };
  var mypos = new google.maps.LatLng(lat, lng);
  $.each(allMarkers, function(m, marker) {

    if (marker.position.lat() == lat) {
      marker.setIcon(hoverImage);
      google.maps.event.addListener(marker, 'mouseout', function() {
          marker.setIcon(hoverImage);
      });
    }
  });

  map.panTo(new google.maps.LatLng(lat, lng));
  map.setZoom(7);
     
}
