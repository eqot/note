'use strict'

class Event

  State:
    RELEASE: 0
    PRESS: 1
  state: null

  note: null
  dom: null

  prevX: null
  prevY: null
  stroke: null

  constructor: (note) ->
    @note = note

    @dom = @note.getDom()
    @dom.addEventListener 'mousedown', @onDown.bind @
    @dom.addEventListener 'mousemove', @onMove.bind @
    @dom.addEventListener 'mouseup',   @onUp.bind @

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


window.Event = Event
