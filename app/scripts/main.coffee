'use strict'

class NoteCore

  note: null

  handlers: {}
  prevHandler: null

  constructor: ->
    @note = new Note '#canvas'

    @handlers['pick'] = new Pick @note
    @handlers['freehand'] = new Event @note

    for button in document.querySelectorAll '#buttons button'
      button.addEventListener 'click', @onClick.bind @

    @changeMode 'freehand'

  onClick: (event) ->
    @changeMode event.target.id

  changeMode: (mode) ->
    @prevHandler?.deactivate()

    handler = @handlers[mode]
    handler?.activate()

    @prevHandler = handler


core = new NoteCore()
