import consumer from "channels/consumer"

const chatChannel = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Hi from the Rails app!')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('Bye from the Rails app!')
  },

  received(data) {
    console.log(data.message);

    const messages = document.getElementById('messages');
    const newMessage = document.createElement('div');
    newMessage.className = 'alert alert-secondary';
    newMessage.innerHTML = data.message;
    messages.appendChild(newMessage);
  },

  speak(content) {
    const timestamp = new Date().toLocaleString();
    return this.perform('speak', { message: content, timestamp: timestamp });
  }
});

// Assign the chatChannel object to App.chat
window.App = window.App || {};
window.App.chat = chatChannel;
