# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.dropdown-menu input, .dropdown-menu label').click (event) ->
    event.stopPropagation()

  $('.dropdown-menu input').change (event) ->
    $btnGroup = $(this).closest(".btn-group")
    $menuItems = $btnGroup.find(".dropdown-menu input:checked")
    selected = []
    $menuItems.each (index, item) ->
      selected.push($(item).val())
    title = ""
    if selected.length > 0 
      title = selected.join(", ") 
    else 
      title = "Please select"

    $btnGroup.find(".btn").text(title)
