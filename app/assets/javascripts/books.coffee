ready = ->
  $('#addModal').on 'shown.bs.modal', ->
    $('#query').focus()

  setTimeout("$('#signinModal').modal()", 500)

  $("#alert").delay(1500).fadeTo(500, 0).slideUp(500)

$( document ).on('turbolinks:load', ready)