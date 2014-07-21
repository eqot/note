'use strict'

class HandlerBase

  SCALE: 64

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
    @onDown? {
      x: x / @SCALE
      y: y / @SCALE
    }

  onNativeMove: (x, y) ->
    @onMove? {
      x: x / @SCALE
      y: y / @SCALE
    }

  onNativeUp: ->
    @onUp?()


window.HandlerBase = HandlerBase
