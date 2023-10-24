class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
    ActionCable.server.broadcast("chat_channel", { message: "#{Time.now} | #{current_user.full_name} joined." })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    ActionCable.server.broadcast("chat_channel", { message: "#{Time.now} | #{current_user.full_name} left." })
  end

  def speak(data)
    timestamp = data["timestamp"]
    message = "#{timestamp} | #{current_user.full_name}: #{data["message"]}"

    message = "#{Time.now} | Server: #{Faker::ChuckNorris.fact}" if message.include?('faker')

    ActionCable.server.broadcast("chat_channel", { message: message })
  end
end