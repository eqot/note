'use strict'

class Note

  s: null

  layer: null

  strokeWidth: 2
  strokeColor: '#000000'
  fillColor: '#ffffff'

  group: null

  constructor: (target) ->
    @s = new Snap target

    @layer = @getNewLayer()

  getDom: ->
    @s.node

  getNewLayer: ->
    return @s.g()

  setStrokeWidth: (width) ->
    @strokeWidth = width

  setStrokeColor: (color) ->
    @strokeColor = color

  setFillColor: (color) ->
    @fillColor = color

  drawLine: (x0, y0, x1, y1) ->
    line = @s.line x0, y0, x1, y1
    line.attr
      stroke: @strokeColor
      strokeWidth: @strokeWidth

  drawPolyline: (stroke) ->
    line = @s.polyline stroke
    line.attr
      stroke: @strokeColor
      strokeWidth: @strokeWidth
      strokeLinecap: 'round'
      strokeLinejoin: 'round'
      fill: 'none'

    @layer.append line

  drawPath: (path) ->
    path = @s.path path
    path.attr
      stroke: @strokeColor
      strokeWidth: @strokeWidth
      strokeLinecap: 'round'
      strokeLinejoin: 'round'
      fill: 'none'

    @layer.append path

    return path

  drawRectangle: (x0, y0, x1, y1) ->
    [x, w] = if x0 < x1 then [x0, x1 - x0] else [x1, x0 - x1]
    [y, h] = if y0 < y1 then [y0, y1 - y0] else [y1, y0 - y1]

    rectangle = @s.rect x, y, w, h
    rectangle.attr
      stroke: @strokeColor
      strokeWidth: @strokeWidth
      fill: @fillColor

    @layer.append rectangle

    return rectangle

  pick: (x, y) ->
    return Snap.getElementByPoint(x, y)

  getAllElements: ->
    return @layer.node.children


window.Note = Note
