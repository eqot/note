'use strict'

class Focus

  element: null

  position: null
  size: null

  constructor: ->
    @element = document.querySelector '#focus'
    @setVisibility false

  set: (target) ->
    {x, y, w, h} = target.getBBox()

    @setPosition x, y
    @setSize w, h

  setPosition: (x, y) ->
    @element.style.left = x + 'px'
    @element.style.top = y + 'px'

    @position = [x, y]

  getPosition: ->
    return @position

  setSize: (width, height) ->
    @element.style.width = width + 'px'
    @element.style.height = height + 'px'

    @size = [width, height]

  getBBox: ->
    if not @position?
      return null

    return {
      x: @position[0]
      y: @position[1]
      x2: @position[0] + @size[0]
      y2: @position[1] + @size[1]
    }

  setVisibility: (isVisible) ->
    if isVisible
      @element.classList.remove 'hide'
    else
      @element.classList.add 'hide'


window.Focus = Focus
