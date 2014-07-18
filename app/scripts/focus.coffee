'use strict'

class Focus

  note: null

  element: null
  layer: null

  position: null

  constructor: (note) ->
    @note = note

    @element = @note.drawRectangle 0, 0, 0, 0
    @element.addClass 'focus'
    @element.attr
      fill: 'none'
    @setVisibility false

    @layer = @note.getNewLayer()
    @layer.append @element

  set: (target) ->
    {x, y, w, h} = target.getBBox()

    @element.attr
      x: x
      y: y
      width: w
      height: h

    @position = [x, y]

  setPosition: (x, y) ->
    @element.attr
      x: x
      y: y

    @position = [x, y]

  getPosition: ->
    return @position

  setVisibility: (isVisible) ->
    if isVisible
      @element.removeClass 'hide'
    else
      @element.addClass 'hide'


window.Focus = Focus
