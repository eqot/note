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
    console.log @element

    @element.addEventListener 'mousedown', @onDown.bind @
    @element.addEventListener 'mousemove', @onMove.bind @
    @element.addEventListener 'mouseup',   @onUp.bind @

  onDown: (event) ->
    @state = @State.PRESS

    @stroke = []

    @prevX = event.x
    @prevY = event.y
    # console.log "#{@prevX}, #{@prevY}"

    @stroke.push event.x
    @stroke.push event.y

  onMove: (event) ->
    if @state is @State.PRESS
      {x, y} = event
      # console.log "#{x}, #{y}"

      # @note.drawLine @prevX, @prevY, x, y

      @prevX = event.x
      @prevY = event.y

      @stroke.push event.x
      @stroke.push event.y

  onUp: (event) ->
    @state = @State.RELEASE

    # console.log @stroke
    @note.drawPolyline @stroke


window.Event = Event
