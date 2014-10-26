# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(document.body).animate 'scrollTop': $('div#search-success').offset().top, 1500

# gotoPosition = (position) ->
#   $(document.body).animate 'scrollTop': $(position).offset().top, 1000

# $(document.body).animate(
#   {'scrollTop': $('div#search-success').offset().top},
#   2000
# );
