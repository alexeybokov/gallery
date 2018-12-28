$(document).on 'turbolinks:load', ->
  $(document).ready ->
    $('.toggleLink').click ->
      if $('.comments').css('display') == 'none'
        $('.comments').css('display', 'inline-block')
      else
        $('.comments').css('display', 'none')
      return
    return
