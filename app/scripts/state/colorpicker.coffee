'use strict'

class ColorPicker

  note: null
  element: null

  constructor: (note) ->
    @note = note

    @element = $('#colorpicker')
    @element.colpick
      color:
        h: 0
        s: 0
        b: 0
      onSubmit: @pick.bind(@)

  pick: (hsb) ->
    color = '#' + $.colpick.hsbToHex hsb

    @element.css 'color', color

    @note.setStrokeColor color

    @element.colpickHide()


window.ColorPicker = ColorPicker
