# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#introvideos').imagesLoaded ->
    $('#introvideos').masonry
      itemSelector: '.box'
      isFitWidth: true
$ ->
  $('#testimonialvideos').imagesLoaded ->
    $('#testimonialvideos').masonry
      itemSelector: '.box'
      isFitWidth: true
