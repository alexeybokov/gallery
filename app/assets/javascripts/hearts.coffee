# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $(document).ready ->
    $('.heart').on 'click', ->
      $.ajax
        url: '/images/' + @id + '/heart'
        type: 'POST'
        success: (r) ->
    return

  $(document).ready ->
    $('.unheart').on 'click', ->
      if confirm('Are your sure?')
        $.ajax
          url: '/images/' + @id + '/unheart'
          type: 'DELETE'
          success: (r) ->
      return
    return
