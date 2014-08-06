'use strict'

class PenWidth

  note: null
  dom: null
  element: null

  constructor: (note) ->
    @note = note

    @dom = @note.getDom()

    for element in document.querySelectorAll '#penwidth li'
      element.addEventListener 'click', @onClick.bind(@)

    @element = document.querySelector '#penwidthvalue'

  onClick: (event) ->
    penWidth = event.target.id

    @note.setStrokeWidth penWidth

    @element.innerHTML = penWidth


window.PenWidth = PenWidth
