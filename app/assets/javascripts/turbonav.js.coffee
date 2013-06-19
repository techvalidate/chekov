$(document).on 'page:fetch', ->
  $('#PageLoading').show()
  $('#Yield').hide()

$(document).on 'page:change', ->
  $('#PageLoading').hide()
  $('#Yield').show()