require 'net/http'
require 'thread'

class Async
  def self.fetch_data
    puts "1. Method started"

    puts "2. Fetching data..."
    puts Net::HTTP.get(URI('http://everlabs.com/'))
    puts "3. Data fetched."

    puts "4. Method executed."
  end

  def self.fetch_data_async
    puts "1. Method started"

    Thread.new do
      puts "2. Fetching data..."
      puts Net::HTTP.get(URI('http://everlabs.com/'))
      puts "3. Data fetched"
    end

    puts "4. Method completed"
  end
end

# CodeExamplesService.new.fetch_data
# CodeExamplesService.new.fetch_data_async