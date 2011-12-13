# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  new PhotoCropper()


class PhotoCropper
  constructor: ->
    $("#cropbox").Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $("#destination_destination_x").val(coords.x)
    $("#destination_destination_y").val(coords.y)
    $("#destination_destination_w").val(coords.w)
    $("#destination_destination_h").val(coords.h)



