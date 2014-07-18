'use strict'

class Pick extends HandlerBase

  State:
    RELEASE: 0
    PRESS: 1

  focus: null
  focusedElements: null

  constructor: (note) ->
    super note

    @focus = new Focus @note
    @focusedElements = []

    @state = @State.RELEASE

  onDown: (event) ->
    event.preventDefault()

    [x, y] = @getPoint event

    element = @note.pick x, y

    @focus.set element
    @focusedElements.push element

  onMove: (event) ->
    event.preventDefault()

  onUp: (event) ->
    event.preventDefault()


window.Pick = Pick
