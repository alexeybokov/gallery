# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
slideIndex = 0

showSlides = ->
  i = undefined
  slides = document.getElementsByClassName('mySlides')
  i = 0
  while i < slides.length
    slides[i].style.display = 'none'
    i++
  slideIndex++
  if slideIndex > slides.length
    slideIndex = 1
  slides[slideIndex - 1].style.display = 'block'
  setTimeout showSlides, 2000
  # Change image every 2 seconds
  return

showSlides()

