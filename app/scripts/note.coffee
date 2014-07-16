'use strict'

class Note

  s: null

  strokeWidth: 1

  constructor: (target) ->
    @s = Snap target

    @draw()

  getElement: ->
    @s.node

  draw: ->
    bigCircle = @s.circle 150, 150, 100
    bigCircle.attr
      fill: "#bada55"
      stroke: "#000"
      strokeWidth: 5

  drawLine: (x0, y0, x1, y1) ->
    line = @s.line x0, y0, x1, y1
    line.attr
      stroke: "#000"
      strokeWidth: @strokeWidth

window.Note = Note
