class CommandStack
  'use strict'

  stack: null

  constructor: ->
    @stack = []

  add: (command) ->
    @stack.push command


window.CommandStack = CommandStack
