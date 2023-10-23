require 'socket'

class SocketsUdp
  def self.run_server
    server = UDPSocket.new
    server.bind('localhost', 8080)
    puts "UDP Server running on port 8080..."

    trap("INT") do
      puts "\nShutting down server..."
      server.close
      exit
    end

    loop do
      msg, addr = server.recvfrom(1024)
      puts "Received: #{msg} from #{addr[1]}"
    end
  end

  def self.run_client
    client = UDPSocket.new
    client.send("Hello, server!", 0, 'localhost', 8080)
    puts "Message sent to server."
  end
end
