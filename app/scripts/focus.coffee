'use strict'

class Focus

  element: null

  position: null

  constructor: ->
    @element = document.querySelector '#focus'
    @setVisibility false

  set: (target) ->
    {x, y, w, h} = target.getBBox()

    @element.style.left = x + 'px'
    @element.style.top = y + 'px'
    @element.style.width = w + 'px'
    @element.style.height = h + 'px'

    @position = [x, y]

  setPosition: (x, y) ->
    @element.style.left = x + 'px'
    @element.style.top = y + 'px'

    @position = [x, y]

  getPosition: ->
    return @position

  setVisibility: (isVisible) ->
    if isVisible
      @element.classList.remove 'hide'
    else
      @element.classList.add 'hide'


window.Focus = Focus
