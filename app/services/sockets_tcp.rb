require 'socket'

class SocketsTcp
  def self.run_server
    server = TCPServer.new(8080)
    puts "Server running on port 8080..."

    trap("INT") do
      puts "\nShutting down server..."
      server.close
      exit
    end

    loop do
      client = server.accept
      client.puts "Hello, client!"
      client.close
    end
  end

  def self.run_client
    client = TCPSocket.new('localhost', 8080)
    puts client.gets
    client.close
  end
end
