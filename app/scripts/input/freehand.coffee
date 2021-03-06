class Freehand extends HandlerBase
  'use strict'

  State:
    RELEASE: 0
    PRESS: 1

  pathNode: null

  prevX: null
  prevY: null

  constructor: (note) ->
    super note

    @state = @State.RELEASE

  onDown: (event) ->
    event.preventDefault?()

    [@prevX, @prevY] = @getPoint event

    path = @note.drawPath "M#{@prevX},#{@prevY}"
    @pathNode = path.node

    @state = @State.PRESS

  onMove: (event) ->
    event.preventDefault?()

    if @state is @State.PRESS
      [x, y] = @getPoint event

      @pathNode.pathSegList.appendItem @pathNode.createSVGPathSegCurvetoQuadraticAbs (x + @prevX) / 2, (y + @prevY) / 2, @prevX, @prevY

      @prevX = x
      @prevY = y

  onUp: ->
    @state = @State.RELEASE

    command = new CommandDrawObject 'path', @pathNode.pathSegList, @note.getState()

    @note.commandStack.add command
    console.log @note.commandStack


window.Freehand = Freehand
