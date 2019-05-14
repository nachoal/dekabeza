# Chat

## Running 

- Ruby 2.5.3
- Rails 5.2.3


## Brief description

When you press enter the message is sent via the websocket connection
It lands in the right channel and gets processed and saved in the database then its sent to the messageRelayJob which triggers my background workers which talk to the actioncable redis connection 
that sends it out to every subscriber and then it gets received and displayed in the browser.

I'm using the `notifications.coffee` file to run a js that asks for permission to the user to be notified 


## Weaknesses 

If actioncable is down the web app will not save any messages since I'm only using ActionCable to create the messages.

Notification request for permission is triggered on page load and it pops up each time.
It would be better to trigger it on a button press to improve UX
