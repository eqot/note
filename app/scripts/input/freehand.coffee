'use strict'

class Freehand extends HandlerBase

  State:
    RELEASE: 0
    PRESS: 1

  prevX: null
  prevY: null
  stroke: null
  path: null

  tmpStroke: null

  constructor: (note) ->
    super note

    @state = @State.RELEASE

  onDown: (event) ->
    event.preventDefault?()

    [x, y] = @getPoint event

    # @stroke = []
    # @stroke.push x, y

    @path = "M#{x},#{y}"

    @prevX = x
    @prevY = y

    @tmpStroke = @note.getNewLayer()

    @state = @State.PRESS

  onMove: (event) ->
    event.preventDefault?()

    if @state is @State.PRESS
      [x, y] = @getPoint event

      @path += " Q#{@prevX},#{@prevY} #{(x + @prevX) / 2},#{(y + @prevY) / 2}"
      line = @note.drawPath @path
      @tmpStroke.append line

      @prevX = x
      @prevY = y

  onUp: (event) ->
    event.preventDefault?()

    @note.drawPath @path

    @tmpStroke.remove()

    @state = @State.RELEASE


window.Freehand = Freehand
