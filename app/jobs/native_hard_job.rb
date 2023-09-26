class NativeHardJob
  include Sidekiq::Job
  sidekiq_options retry: 5

  def perform(post_id)
    puts "#{self.class} STARTED at #{Time.now}"

    begin
      post = Post.find(post_id)
      puts "Post title: #{post.title}"
    rescue => e
      Sidekiq.logger.error "Caught an exception: #{e.message}"
      raise e
    end

    puts "#{self.class} FINISHED at #{Time.now}"
  end
end

# Enqueue a job to be performed later.
# HardJob.perform_later(1, 120)

# Enqueue a job to be performed 1 week from now.
# HardJob.set(wait: 1.week).perform_later(1, 60)

