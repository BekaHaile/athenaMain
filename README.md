# Athena - conversational chatbot
Athena is an interactive AI agent running on a tablet device mounted in an open area on or next to the front desk of a hotel. The tablet has a built-in camera, speakers, and microphone, with touch screen functionality.

## Instructions:

- clone this repository

### Train the model
- > rasa train

### Run the bot 
- > rasa run -m models --enable-api --cors "*" --debug

### Run the actions seperately
 - > rasa run actions

 - Open index.html file in browser.