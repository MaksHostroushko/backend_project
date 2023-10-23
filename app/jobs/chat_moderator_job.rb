class ChatModeratorJob
  include Sidekiq::Job
  sidekiq_options retry: 5

  def perform
    ActionCable.server.broadcast(
      "chat_channel",
      { message: "#{Time.now}: #{self.class.name} says: #{Faker::ChuckNorris.fact}" }
    )
  end
end
