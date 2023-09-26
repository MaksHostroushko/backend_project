class HardJob < ApplicationJob
  def perform(post_id, seconds = nil)
    puts "#{self.class} STARTED at #{Time.now}"

    sleep seconds if seconds

    post = Post.find_by(id: post_id)

    puts "Post title: #{post&.title}"

    puts "#{self.class} FINISHED at #{Time.now}"
  end
end

# Enqueue a job to be performed later.
# HardJob.perform_later(1, 120)

# Enqueue a job to be performed 1 week from now.
# HardJob.set(wait: 1.week).perform_later(1, 60)

