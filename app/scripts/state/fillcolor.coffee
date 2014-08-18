'use strict'

class FillColor

  note: null
  element: null

  constructor: (note) ->
    @note = note

    @element = $('#fillcolor')
    @element.colpick
      color:
        h: 0
        s: 0
        b: 0
      onSubmit: @pick.bind(@)

  pick: (hsb) ->
    color = '#' + $.colpick.hsbToHex hsb

    @element.css 'color', color

    @note.setFillColor color

    @element.colpickHide()


window.FillColor = FillColor
