'use strict'

class NoteCore

  note: null

  handlers: {}
  prevHandler: null

  constructor: ->
    @note = new Note '#canvas'

    @handlers['pick'] = new Pick @note
    @handlers['freehand'] = new Freehand @note
    @handlers['rectangle'] = new Rectangle @note

    for button in document.querySelectorAll '#buttons button'
      button.addEventListener 'click', @onClick.bind @

    @setMode 'freehand'
    # @setMode 'rectangle'

  onClick: (event) ->
    @setMode event.target.id

  setMode: (mode) ->
    @prevHandler?.deactivate()

    handler = @handlers[mode]
    handler?.activate()

    window.native =
      mouseDown: handler.onNativeDown.bind handler
      mouseMove: handler.onNativeMove.bind handler
      mouseUp:   handler.onNativeUp.bind handler

    @prevHandler = handler


core = new NoteCore()
