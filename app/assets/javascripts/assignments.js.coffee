$(document).ready ->
  $('input.assignment').click ->
    $(this).parent('form:first').submit();