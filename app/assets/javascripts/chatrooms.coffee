$(document).on "turbolinks:load", ->
  $(".join-now").on "click", (e) ->
    cr_id = e.currentTarget.attributes[1].value
    body  = $("#current_user")[0].innerText + "has joined the channel"
    App.chatrooms.send_message(cr_id, body)
  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      $(this).submit()
  $("#new_message").on "submit", (e) ->
    e.preventDefault()
    chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
    body        = $("#message_body") 

    App.chatrooms.send_message(chatroom_id, body.val())
    body.val("")