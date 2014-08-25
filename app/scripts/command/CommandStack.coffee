class CommandStack
  'use strict'

  stack: null

  constructor: ->
    @stack = []

    (document.querySelector '#undo').addEventListener 'click', @undo.bind(@)
    (document.querySelector '#redo').addEventListener 'click', @redo.bind(@)

  add: (command) ->
    @stack.push command

  undo: ->
    console.log 'undo'

  redo: ->
    console.log 'redo'


window.CommandStack = CommandStack
