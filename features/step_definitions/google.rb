# require 'rubygems'
# require 'selenium-webdriver'

# Given('I am on the {string}') do |string|
#   @driver = Selenium::WebDriver.for :chrome
#   @driver.get "http://google.com"
# end

# When('fill in search with {string}') do |string|
#   element = @driver.find_element(name: "q")
#   element.send_keys "cucumber"
#   element.submit
# end

# Then('I should see {string}') do |string|
#   wait = Selenium::WebDriver::Wait.new(timeout: 10)
#   wait.until { @driver.title.downcase.start_with? "cucumber" }
#   puts "Page title is #{@driver.title}"
# end
