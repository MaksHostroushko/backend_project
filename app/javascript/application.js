// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "channels"

window.sendMessage = function() {
  const chatInput = document.getElementById('chat-input');
  App.chat.speak(chatInput.value);
  chatInput.value = ''
}

console.log('application.js loaded')