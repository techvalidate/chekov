$(document).ready ->
  $('td.clickable').click ->
    Turbolinks.visit($(this).find('a:first').attr('href'))

$(document).on 'page:change', ->
  $('td.clickable').click ->
    Turbolinks.visit($(this).find('a:first').attr('href'))