$(document).ready ->
  $('td.clickable').click ->
    window.location = $(this).find('a:first').attr('href')