'use strict'

class Event

  State:
    RELEASE: 0
    PRESS: 1
  state: null

  note: null
  element: null

  prevX = null;
  prevY = null;

  stroke: null

  constructor: (note) ->
    @state = @State.RELEASE

    @note = note

    @element = @note.getElement()
    @element.addEventListener 'mousedown', @onDown.bind @
    @element.addEventListener 'mousemove', @onMove.bind @
    @element.addEventListener 'mouseup',   @onUp.bind @

  onDown: (event) ->
    @state = @State.PRESS

    {x, y} = event

    @stroke = []
    @stroke.push x
    @stroke.push y

    @prevX = x
    @prevY = y

    @note.startLine()

  onMove: (event) ->
    if @state is @State.PRESS
      {x, y} = event

      @note.drawLine @prevX, @prevY, x, y

      @stroke.push x
      @stroke.push y

      @prevX = x
      @prevY = y

  onUp: (event) ->
    @state = @State.RELEASE

    line = @note.endLine()
    line.remove()

    # console.log @stroke
    @note.drawPolyline @stroke


window.Event = Event
