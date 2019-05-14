# Chat
Live project at [https://dekabeza.herokuapp.com/](https://dekabeza.herokuapp.com/)
## Running 

- Ruby 2.5.3
- Rails 5.2.3
- Redis 

## Brief description

1. When you press enter the message is sent via the websocket connection
2. It lands in the right channel and gets processed and saved in the database 
3. then its sent to the messageRelayJob which triggers my background workers 
4. which talk to the actioncable redis connection 
5. that sends it out to every subscriber and then it gets received and displayed in the browser.

I'm using the `notifications.coffee` file to run a js that asks for permission to the user to be notified with a basic message only when the user is not currently viewing the window. 


## Weaknesses 

If actioncable is down the web app will not save any messages since I'm only using ActionCable to create the messages.
It will be useful to consider the scalability and possible failure of this setup 

Notification request for permission is triggered on page load and it pops up each time.
It would be better to trigger it on a button press to improve UX

Currently no UI popup notifies users that they can only chat if joined to a channel
