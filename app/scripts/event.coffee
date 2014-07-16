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

    @prevX = event.x
    @prevY = event.y
    # console.log "#{@prevX}, #{@prevY}"

  onMove: (event) ->
    if @state is @State.PRESS
      {x, y} = event
      # console.log "#{x}, #{y}"

      @note.drawLine @prevX, @prevY, x, y

      @prevX = event.x
      @prevY = event.y

  onUp: (event) ->
    @state = @State.RELEASE


window.Event = Event
