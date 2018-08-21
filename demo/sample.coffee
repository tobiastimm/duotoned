InputModule = require "input-framer/input"

pushAction.draggable.enabled = true
pushAction.draggable.horizontal = true
pushAction.draggable.vertical = true
pushAction.draggable.overdrag = true
pushAction.draggable.bounce = true
pushAction.draggable.momentum = false

pushActionOriginX = pushAction.x
pushActionOriginY = pushAction.y
isDropped = false
isTargetGroupAdded = false
gridColor = "#ffe1ce"
gridHoverColor = "#ffb17f"

pushAction.style =
	cursor: "pointer"

pushAction.on Events.MouseOver, ->
	pushAction.color = "#FF6400"

pushAction.on Events.DragStart, ->
  pushAction.animate
    properties:
      scale: 1.2
    curve: "ease-in"
    time: .2
  pushAction.style =
    boxShadow: "0px 2px 4px 0px rgba(0,0,0,0.6)"

removeButton.onClick (event, layer) ->
  removeButton.text = '#ffffff'

pushAction.on Events.DragMove, ->
  if pushAction.midY > grid.y
    grid.backgroundColor = gridHoverColor
    grid.animate
      time: .2
  else
    grid.backgroundColor = gridColor
    grid.animate
      time: .2

pushAction.on Events.DragEnd, ->
  if pushAction.midY > grid.y
    layer = message.copy()
    layer.x = pushAction.x
    layer.y = pushAction.y
    layer.draggable.enabled = true
    layer.draggable.horizontal = true
    layer.draggable.vertical = true
    layer.draggable.momentum = false
    layer.draggable.constraints = {
        x: grid.x + 20
        y: grid.y + 20
        width: grid.width - 40
        height: grid.height - 40
    }
    layer.children[3].on Events.Click, ->
        layer.destroy()
    layer.style =
      cursor: "pointer"
    layer.on Events.DragStart, ->
      layer.animate
        properties:
          scale: 1.2
        curve: "ease-in"
        time: .2
      layer.style =
        boxShadow: "0px 2px 4px 0px rgba(0,0,0,0.6)"
    layer.on Events.DragEnd, ->
       layer.animate
        properties:
          scale: 1
        curve: "ease-out"
        time: .2
       layer.style =
        boxShadow: ""


  grid.backgroundColor = '#ffffff'
  pushAction.animate
    properties:
      x: pushActionOriginX
      y: pushActionOriginY
      scale: 1
    curve: "spring( 300, 15, 0 )"
  pushAction.style =
    boxShadow: ""

addTargetGroup.style =
	cursor: "pointer"

addTargetGroup.onClick (event, layer) ->
  if !isTargetGroupAdded
    isTargetGroupAdded = true
    targetLayer = powerUser.copy()
    targetLayer.x = grid.midX - 100
    targetLayer.y = grid.y + 20
    targetLayer.draggable.enabled = true
    targetLayer.draggable.horizontal = true
    targetLayer.draggable.vertical = true
    targetLayer.draggable.momentum = false
    targetLayer.draggable.constraints = {
      x: grid.x + 20
      y: grid.y + 20
      width: grid.width - 40
      height: grid.height - 40
    }
    targetLayer.on Events.DragStart, ->
       targetLayer.animate
         properties:
           scale: 1.2
         curve: "ease-in"
         time: .2
       targetLayer.style =
         boxShadow: "0px 2px 4px 0px rgba(0,0,0,0.6)"
     targetLayer.on Events.DragEnd, ->
      targetLayer.animate
       properties:
         scale: 1
       curve: "ease-out"
       time: .2
      targetLayer.style =
       boxShadow: ""






