'use strict'

class Focus

  note: null

  element: null
  layer: null

  constructor: (note) ->
    @note = note

    @element = @note.drawRectangle 100, 100, 200, 200
    @element.addClass 'focus'

    @layer = @note.getNewLayer()
    @layer.append @element

  set: (target) ->
    {x, y, w, h} = target.getBBox()

    @element.attr
      x: x
      y: y
      width: w
      height: h


window.Focus = Focus
