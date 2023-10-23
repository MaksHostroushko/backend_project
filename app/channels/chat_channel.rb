class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    timestamp = data["timestamp"]
    message = "#{timestamp}: #{data["message"]}"

    message = "Server: #{Faker::ChuckNorris.fact}" if message.include?('faker')

    ActionCable.server.broadcast("chat_channel", { message: message })
  end
end