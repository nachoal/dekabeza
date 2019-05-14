class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatrooms:#{message.chatroom.id}", {
      # send message, render the message partial in views pulling it out from class
      # Since its a message active record model it will interpret that it needs to
      # go to app/views/messages/ message partial
      message: MessagesController.render(message),
      # a way to filter what is currently being viewed and what messages
      # are being displayed for view notifications
      chatroom_id: message.chatroom.id
    }
  end
end
