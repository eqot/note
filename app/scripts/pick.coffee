'use strict'

class Pick extends EventHandler

  State:
    RELEASE: 0
    PRESS: 1

  constructor: (note) ->
    super note

    @state = @State.RELEASE

  onDown: (event) ->
    {x, y} = event

    console.log x, y

  onMove: (event) ->

  onUp: (event) ->


window.Pick = Pick
