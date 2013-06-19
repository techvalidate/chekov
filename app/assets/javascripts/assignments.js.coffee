$(document).ready ->
  $('input.assignment').click ->
    $(this).parent('form:first').submit();

$(document).on 'page:change', ->
  $('input.assignment').click ->
    $(this).parent('form:first').submit();