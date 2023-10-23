module ApplicationCable
  class Connection < ActionCable::Connection::Base
    def connect
      puts 'Someone connected via ActionCable!'
    end
  end
end
