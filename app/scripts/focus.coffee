'use strict'

class Focus

  FOCUS_STROKES: [
    [0, 0, 50, 0, 100, 0],
    [100, 0, 100, 50, 100, 100],
    [100, 100, 50, 100, 0, 100],
    [0, 100, 0, 50, 0, 0]
  ]

  note: null

  layer: null

  position: null

  constructor: (note) ->
    @note = note

    rectangle = @note.drawRectangle 0, 0, 10, 10
    marker = rectangle.marker 0, 0, 10, 10, 5, 5
    marker.attr
      id: 'rect'
      overflow: 'visible'
      markerUnits: 'userSpaceOnUse'
      orient: '0'
    marker.toDefs()

    @layer = @note.getNewLayer()
    @layer.addClass 'focus'
    for stroke in @FOCUS_STROKES
      element = @note.drawPolyline stroke
      element.attr
        fill: 'none'
      element.node.setAttribute 'marker-start', 'url("#rect")'
      element.node.setAttribute 'marker-mid', 'url("#rect")'

      @layer.append element

    @setVisibility true

  set: (target) ->
    {x, y, w, h} = target.getBBox()

    console.log @layer

    @element.attr
      x: x
      y: y
      width: w
      height: h

    @position = [x, y]

  setPosition: (x, y) ->
    @element.attr
      x: x
      y: y

    @position = [x, y]

  getPosition: ->
    return @position

  setVisibility: (isVisible) ->
    if isVisible
      @layer.removeClass 'hide'
    else
      @layer.addClass 'hide'


window.Focus = Focus
