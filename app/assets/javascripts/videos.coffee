# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$ ->
  $('#ic2introvideos').imagesLoaded ->
    $('#ic2introvideos').masonry
      itemSelector: '.box'
      isFitWidth: true
$ ->
  $('#ic2testimonialvideos').imagesLoaded ->
    $('#ic2testimonialvideos').masonry
      itemSelector: '.box'
      isFitWidth: true
