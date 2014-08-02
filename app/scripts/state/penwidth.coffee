'use strict'

class PenWidth

  note: null
  dom: null

  constructor: (note) ->
    @note = note

    @dom = @note.getDom()

  activate: ->

  deactivate: ->
