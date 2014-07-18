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

    @removeFocusAll()

    # Set focus if any elements were picked
    if element.node.id isnt 'canvas'
      @setFocus element

  onMove: (event) ->
    event.preventDefault()

  onUp: (event) ->
    event.preventDefault()

  setFocus: (element) ->
    @focus.set element
    @focusedElements.push element

    @focus.setVisibility true

  removeFocusAll: ->
    @focusedElements = []

    @focus.setVisibility false


window.Pick = Pick
