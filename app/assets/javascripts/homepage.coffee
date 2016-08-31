$(document).on "turbolinks:load", ->

  $("figure.slicker_image").each (index, element) ->
    backgroundColor = $(element).data("placeholder-color")
    $(element).css("background-color", backgroundColor)

  $("img.slicker_image__image").load (e) ->
    $figure = $(this).parents("figure.slicker_image")
    $image  = $(this)
    $image.fadeIn(2000)
