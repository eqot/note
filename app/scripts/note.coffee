'use strict'

class Note

  s: null

  layer: null

  strokeColor: '#000000'
  strokeWidth: 1
  fillColor: '#ffffff'

  group: null

  constructor: (target) ->
    @s = Snap target

    @layer = @getNewLayer()

  getDom: ->
    @s.node

  getNewLayer: ->
    return @s.g()

  startLine: ->
    @group = @s.g()

  drawLine: (x0, y0, x1, y1) ->
    line = @s.line x0, y0, x1, y1
    line.attr
      stroke: @strokeColor
      strokeWidth: @strokeWidth

    @group.append line

  endLine: ->
    return @group

  drawPolyline: (stroke) ->
    line = @s.polyline stroke
    line.attr
      stroke: @strokeColor
      strokeWidth: @strokeWidth
      fill: 'none'

    @layer.append line

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


window.Note = Note
