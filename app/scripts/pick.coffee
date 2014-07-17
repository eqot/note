'use strict'

class Pick

  State:
    RELEASE: 0
    PRESS: 1
  state: null

  note: null
  dom: null

  constructor: (note) ->
    @note = note

    @dom = @note.getDom()
    @dom.addEventListener 'mousedown', @onDown.bind @
    @dom.addEventListener 'mousemove', @onMove.bind @
    @dom.addEventListener 'mouseup',   @onUp.bind @

    @state = @State.RELEASE

  onDown: (event) ->
    {x, y} = event

    console.log x, y

  onMove: (event) ->

  onUp: (event) ->


window.Pick = Pick
