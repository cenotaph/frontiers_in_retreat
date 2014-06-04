// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.core
//= require jquery.ui.dialog
//= require turbolinks
//= require hiap

function showUrlInDialog(url){
   var tag = $("<div></div>");
   $.ajax({
     url: url,
     success: function(data) {
       tag.html(data).dialog({modal: false, width: '32em', draggable: true,  maxHeight: 500, position: { my: "left top", at: "right+20 top", of: '#main_menu'}
     }).dialog('open');
       
       $('.ui-dialog-titlebar button').click(function() {
         $('#main_menu a').css('color', "#000");          
       });
     }
   });
 }
 
