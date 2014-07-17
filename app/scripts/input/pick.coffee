'use strict'

class Pick extends HandlerBase

  State:
    RELEASE: 0
    PRESS: 1

  constructor: (note) ->
    super note

    @state = @State.RELEASE

  onDown: (event) ->
    event.preventDefault()

    [x, y] = @getPoint event

    console.log x, y

  onMove: (event) ->
    event.preventDefault()

  onUp: (event) ->
    event.preventDefault()


window.Pick = Pick
