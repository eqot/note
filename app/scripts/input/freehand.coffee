'use strict'

class Freehand extends HandlerBase

  State:
    RELEASE: 0
    PRESS: 1

  prevX: null
  prevY: null
  stroke: null

  constructor: (note) ->
    super note

    @state = @State.RELEASE

  onDown: (event) ->
    event.preventDefault()

    [x, y] = @getPoint event

    @stroke = []
    @stroke.push x, y

    @prevX = x
    @prevY = y

    @note.startLine()

    @state = @State.PRESS

  onMove: (event) ->
    event.preventDefault()

    if @state is @State.PRESS
      [x, y] = @getPoint event

      @note.drawLine @prevX, @prevY, x, y

      @stroke.push x, y

      @prevX = x
      @prevY = y

  onUp: (event) ->
    event.preventDefault()

    # console.log @stroke
    @note.drawPolyline @stroke

    line = @note.endLine()
    line.remove()

    @state = @State.RELEASE


window.Freehand = Freehand
