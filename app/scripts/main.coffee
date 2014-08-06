'use strict'

class NoteCore

  note: null

  elements: {}
  handlers: {}
  states: {}
  mode: null

  constructor: ->
    @note = new Note '#canvas'

    @handlers['pick'] = new Pick @note
    @handlers['freehand'] = new Freehand @note
    @handlers['rectangle'] = new Rectangle @note

    @states['penwidth'] = new PenWidth @note

    for button in document.querySelectorAll '#buttons button'
      @elements[button.id] = button
      button.addEventListener 'click', @onClick.bind(@)

    @setMode 'freehand'
    # @setMode 'rectangle'

  onClick: (event) ->
    id = event.target.id

    if @states[id]?
      @setState id
    else
      @setMode id

  setMode: (mode) ->
    if @mode? and @mode.length > 0
      @elements[@mode].classList.remove 'active'
      @handlers[@mode].deactivate()

    @mode = mode

    @elements[@mode].classList.add 'active'

    handler = @handlers[@mode]
    if handler?
      handler.activate()

      window.native =
        mouseDown: handler.onNativeDown.bind handler
        mouseMove: handler.onNativeMove.bind handler
        mouseUp:   handler.onNativeUp.bind handler

  setState: (state) ->
    # console.log state

core = new NoteCore()
