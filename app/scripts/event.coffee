'use strict'

class Event

  State:
    RELEASE: 0
    PRESS: 1
  state: null

  note: null
  element: null

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

    {x, y} = event
    console.log "#{x}, #{y}"

  onMove: (event) ->
    if @state is @State.PRESS
      {x, y} = event
      console.log "#{x}, #{y}"

  onUp: (event) ->
    @state = @State.RELEASE


window.Event = Event
