'use strict'

class EventHandler

  state: null

  note: null
  dom: null

  constructor: (note) ->
    @note = note

    @dom = @note.getDom()

    @dom.addEventListener 'mousedown', @onDown?.bind @
    @dom.addEventListener 'mousemove', @onMove?.bind @
    @dom.addEventListener 'mouseup',   @onUp?.bind @


window.EventHandler = EventHandler
