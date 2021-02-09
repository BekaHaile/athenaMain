# Athena - conversational chatbot
Athena is an interactive AI agent running on a tablet device mounted in an open area on or next to the front desk of a hotel. The tablet has a built-in camera, speakers, and microphone, with touch screen functionality.

## Instructions:

- clone this repository

### run rasa
Inside rasa directory
- rasa train
- rasa run -m models --enable-api --cors "*" --debug

### Generate a public URL pointing to your local Rasa server
Download ngrok(https://ngrok.com/download) and run `ngrok http 5005` in a new terminal window to generate a public URL pointing to your local Rasa server, which is running on port 5005

### run android assistant
open aimybox-android-assistant on android studio
- Connect your Android device to your local machine using a USB cable and click on the green play button in the Android Studio toolbar.
Note: Be sure to replace the Rasa webhook URL inside AimyboxApplication class under app/src/main/java/com.justai.aimybox.assistant with your ngrok URL!


