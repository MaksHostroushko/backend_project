require 'byebug'

class HardJob < ActiveJob::Base
  # queue_as :default

  def perform(seconds = nil)
    Rails.logger.info "#{self.class} STARTED at #{Time.now}"

    # byebug

    sleep seconds if seconds

    Rails.logger.info "#{self.class} FINISHED at #{Time.now}"
  end
end
