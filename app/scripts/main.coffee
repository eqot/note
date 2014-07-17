'use strict'

class NoteCore

  note: null

  handlers: {}
  prevHandler: null

  constructor: ->
    @note = new Note '#canvas'

    @handlers['pick'] = new Pick @note
    @handlers['freehand'] = new Freehand @note

    for button in document.querySelectorAll '#buttons button'
      button.addEventListener 'click', @onClick.bind @

    @setMode 'freehand'

  onClick: (event) ->
    @setMode event.target.id

  setMode: (mode) ->
    @prevHandler?.deactivate()

    handler = @handlers[mode]
    handler?.activate()

    @prevHandler = handler


core = new NoteCore()
