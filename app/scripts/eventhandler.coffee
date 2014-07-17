'use strict'

class EventHandler

  state: null

  note: null
  dom: null

  listeners: null

  constructor: (note) ->
    @note = note

    @dom = @note.getDom()

    @listeners = []

  activate: ->
    @addListener @dom, 'mousedown', @onDown?.bind @
    @addListener @dom, 'mousemove', @onMove?.bind @
    @addListener @dom, 'mouseup',   @onUp?.bind @

  deactivate: ->
    @removeAllListeners()

  addListener: (target, event, listener) ->
    target.addEventListener event, listener

    @listeners.push [target, event, listener]

  removeAllListeners: ->
    for [target, event, listener] in @listeners
      target.removeEventListener event, listener

window.EventHandler = EventHandler
