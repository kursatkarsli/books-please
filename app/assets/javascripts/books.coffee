ready = ->
  $('#addModal').on 'shown.bs.modal', ->
    $('#query').focus()
  setTimeout("$('#signinModal').modal()", 500)

$( document ).on('turbolinks:load', ready)