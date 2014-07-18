'use strict'

class Pick extends HandlerBase

  State:
    RELEASE: 0
    PRESS: 1

  focus: null
  focusedElements: null

  focusPosition: null

  constructor: (note) ->
    super note

    @focus = new Focus @note
    @focusedElements = []

    @state = @State.RELEASE

  deactivate: ->
    super()

    @removeFocusAll()

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

    element.drag()
    element.drag @moveFocus.bind(@), @moveFocusStart.bind(@), @moveFocusEnd.bind(@)

  moveFocusStart: (x, y, event) ->
    @focusPosition = @focus.getPosition()

  moveFocus: (dx, dy) ->
    [x, y] = @focusPosition
    @focus.setPosition x + dx, y + dy

  moveFocusEnd: (event) ->
    @focusPosition = null

  removeFocusAll: ->
    for element in @focusedElements
      element.undrag()

    @focusedElements = []

    @focus.setVisibility false


window.Pick = Pick
