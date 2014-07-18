'use strict'

class Rectangle extends HandlerBase

  State:
    RELEASE: 0
    PRESS: 1

  startX: null
  startY: null

  rectangle: null

  constructor: (target) ->
    super target

    @state = @State.RELEASE

  onDown: (event) ->
    event.preventDefault()

    [@startX, @startY] = @getPoint event

    @state = @State.PRESS

  onMove: (event) ->
    event.preventDefault()

    @rectangle?.remove()

    if @state is @State.PRESS
      [x, y] = @getPoint event

      @rectangle = @note.drawRectangle @startX, @startY, x, y

  onUp: (event) ->
    event.preventDefault()

    @rectangle = null
    @startX = @startY = null

    @state = @State.RELEASE


window.Rectangle = Rectangle
