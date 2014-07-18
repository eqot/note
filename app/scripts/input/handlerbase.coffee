'use strict'

class HandlerBase

  state: null

  note: null
  dom: null

  listeners: null

  devicePixelRatio: 1

  event:
    preventDefault: ->

  constructor: (note) ->
    @note = note

    @dom = @note.getDom()

    @listeners = []

    @devicePixelRatio = window.devicePixelRatio

  activate: ->
    @addListener @dom, 'mousedown', @onDown?.bind @
    @addListener @dom, 'mousemove', @onMove?.bind @
    @addListener @dom, 'mouseup',   @onUp?.bind @

    @addListener @dom, 'touchstart', @onDown?.bind @
    @addListener @dom, 'touchmove',  @onMove?.bind @
    @addListener @dom, 'touchend',   @onUp?.bind @

  deactivate: ->
    @removeAllListeners()

  addListener: (target, event, listener) ->
    target.addEventListener event, listener, true

    @listeners.push [target, event, listener]

  removeAllListeners: ->
    for [target, event, listener] in @listeners
      target.removeEventListener event, listener, true

  getPoint: (event) ->
    if event.touches?
      return [event.touches[0].clientX, event.touches[0].clientY]
    else
      return [event.x, event.y]

  onNativeDown: (x, y) ->
    @event.x = x / @devicePixelRatio
    @event.y = y / @devicePixelRatio

    @onDown? @event

  onNativeMove: (x, y) ->
    @event.x = x / @devicePixelRatio
    @event.y = y / @devicePixelRatio

    @onMove? @event

  onNativeUp: ->
    @onUp? @event


window.HandlerBase = HandlerBase
