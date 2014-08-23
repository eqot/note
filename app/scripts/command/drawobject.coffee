class CommandDrawObject extends CommandBase
  'use strict'

  type: null
  args: null
  state: null

  object: null

  constructor: (type, args, state) ->
    @type = type
    @args = args
    @state = state

  do: (note) ->
    @object = note.drawPath @args, @state

  undo: (note) ->
    note.remove @object


window.CommandDrawObject = CommandDrawObject
