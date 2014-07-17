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
    {x, y} = event

    @stroke = []
    @stroke.push x, y

    @prevX = x
    @prevY = y

    @note.startLine()

    @state = @State.PRESS

  onMove: (event) ->
    if @state is @State.PRESS
      {x, y} = event

      @note.drawLine @prevX, @prevY, x, y

      @stroke.push x, y

      @prevX = x
      @prevY = y

  onUp: (event) ->
    # console.log @stroke
    @note.drawPolyline @stroke

    line = @note.endLine()
    line.remove()

    @state = @State.RELEASE


window.Freehand = Freehand
