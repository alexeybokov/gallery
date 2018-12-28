# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
<<<<<<< HEAD
#$(document).on 'turbolinks:load', ->
#  $(document).ready ->
#    $('.heart').on 'click', ->
#      $.ajax
#        url: '/hearts'
#        type: 'POST'
#        success: (r) ->
#    return
#
#  $(document).ready ->
#    $('.unheart').on 'click', ->
#      if confirm('Are your sure?')
#        $.ajax
#          url: '/hearts/' + @id
#          type: 'DELETE'
#          success: (r) ->
#      return
#    return
=======
$(document).on 'turbolinks:load', ->
#


  $(document).ready ->
    $('.unheart').on 'click', ->
      if confirm('Are your sure?')
        $.ajax
          url: '/hearts/' + @id
          type: 'DELETE'
          success: (r) ->
      return
    return

  $(document).ready ->
    $('.heart').on 'click', ->
      $.ajax
        url: '/hearts'
        type: 'POST'
        success: (r) ->
    return
>>>>>>> fe141745849c44ce541fd6d015eee85cfc896ee0
