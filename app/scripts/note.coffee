'use strict'

class Note

  s: null

  strokeColor: '#000000'
  strokeWidth: 1

  group: null

  constructor: (target) ->
    @s = Snap target

  getDom: ->
    @s.node

  startLine: ->
    @group = @s.g()

  drawLine: (x0, y0, x1, y1) ->
    line = @s.line x0, y0, x1, y1
    line.attr
      stroke: @strokeColor
      strokeWidth: @strokeWidth

    @group.add line

  endLine: ->
    return @group

  drawPolyline: (stroke) ->
    line = @s.polyline stroke
    line.attr
      stroke: @strokeColor
      strokeWidth: @strokeWidth
      fill: 'none'


window.Note = Note
