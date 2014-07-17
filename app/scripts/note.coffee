'use strict'

class Note

  s: null

  strokeColor: '#000000'
  strokeWidth: 1

  group: null

  constructor: (target) ->
    @s = Snap target

    # @draw()

  getElement: ->
    @s.node

  draw: ->
    bigCircle = @s.circle 150, 150, 100
    bigCircle.attr
      fill: "#bada55"
      stroke: "#000"
      strokeWidth: 5

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
      fill: "none"


window.Note = Note
