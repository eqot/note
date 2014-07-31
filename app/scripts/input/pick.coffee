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

    @focus = new Focus()
    @focusedElements = []

    @state = @State.RELEASE

  deactivate: ->
    super()

    @removeFocusAll()

  onDown: (event) ->
    event.preventDefault?()

    @removeFocusAll()

    [x, y] = @getPoint event
    @focusPosition = [x, y]

    element = @note.pick x, y

    # Set focus if any elements were picked
    if element.node.id isnt 'canvas'
      @setFocus element

    @focus.setVisibility true

    @state = @State.PRESS

  onMove: (event) ->
    event.preventDefault?()

    if @state is @State.PRESS
      [x0, y0] = @focusPosition
      [x1, y1] = @getPoint event

      [x, w] = if x0 < x1 then [x0, x1 - x0] else [x1, x0 - x1]
      [y, h] = if y0 < y1 then [y0, y1 - y0] else [y1, y0 - y1]

      @focus.setPosition x, y
      @focus.setSize w, h

  onUp: (event) ->
    event.preventDefault?()

    @state = @State.RELEASE

    focusBBox = @focus.getBBox()
    if not focusBBox?
      return

    focusedElements = []
    for element in @note.getAllElements()
      if Snap.path.isBBoxIntersect focusBBox, element.getBBox()
        focusedElements.push element

    console.log focusedElements

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
