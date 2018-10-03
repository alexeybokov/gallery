# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Execute the function and show all columns

filterSelection = (c) ->
  x = undefined
  i = undefined
  x = document.getElementsByClassName('column')
  if c == 'all'
    c = ''
  # Add the "show" class (display:block) to the filtered elements, and remove the "show" class from the elements that are not selected
  i = 0
  while i < x.length
    w3RemoveClass x[i], 'show'
    if x[i].className.indexOf(c) > -1
      w3AddClass x[i], 'show'
    i++
  return

# Show filtered elements

w3AddClass = (element, name) ->
  i = undefined
  arr1 = undefined
  arr2 = undefined
  arr1 = element.className.split(' ')
  arr2 = name.split(' ')
  i = 0
  while i < arr2.length
    if arr1.indexOf(arr2[i]) == -1
      element.className += ' ' + arr2[i]
    i++
  return

# Hide elements that are not selected

w3RemoveClass = (element, name) ->
  i = undefined
  arr1 = undefined
  arr2 = undefined
  arr1 = element.className.split(' ')
  arr2 = name.split(' ')
  i = 0
  while i < arr2.length
    while arr1.indexOf(arr2[i]) > -1
      arr1.splice arr1.indexOf(arr2[i]), 1
    i++
  element.className = arr1.join(' ')
  return

filterSelection 'all'
# Add active class to the current button (highlight it)
btnContainer = document.getElementById('myBtnContainer')
btns = btnContainer.getElementsByClassName('btn')
i = 0
while i < btns.length
  btns[i].addEventListener 'click', ->
    current = document.getElementsByClassName('active')
    current[0].className = current[0].className.replace(' active', '')
    @className += ' active'
    return
  i++

