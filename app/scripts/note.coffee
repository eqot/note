'use strict'

class Note

  s: null

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


window.Note = Note
