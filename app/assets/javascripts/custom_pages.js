# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
/*Requieres jQuery*/
$('#myModal').bind('hide', function () {
 var iframe = $(this).children('div.modal-body').find('iframe');
 var src = iframe.attr('src');
 iframe.attr('src', '');
 iframe.attr('src', src);
});

$(‘.btnFullscreen’).on(‘click’, 
function() {
videoPlayer[0].webkitEnterFullscreen();
videoPlayer[0].mozRequestFullScreen();
return false;
});
