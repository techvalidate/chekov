$(document).ready ->
  $('a.add_element').click (event) ->
      length = $('input.story_element').length
      $('#Elements').append '<p><input class="story_element" id="story_elements_attributes_'+length+'_description" name="story[elements_attributes]['+length+'][description]" size="30" type="text" /></p>' 
      event.preventDefault()

$(document).on 'page:change', ->
  $('a.add_element').click (event) ->
      length = $('input.story_element').length
      $('#Elements').append '<p><input class="story_element" id="story_elements_attributes_'+length+'_description" name="story[elements_attributes]['+length+'][description]" size="30" type="text" /></p>' 
      event.preventDefault()