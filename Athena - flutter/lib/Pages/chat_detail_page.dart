import 'package:athena_2/Components/chat_bubble.dart';
import 'package:athena_2/Components/loader.dart';
import 'package:athena_2/Models/chat_message.dart';
import 'package:athena_2/Services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:wakelock/wakelock.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> chatMessage = [
    ChatMessage(
        message: "Hi I am athena, I can: \n" +
            "- Provide you with a list of recommended area restaurants \n" +
            "- Get you directions to the most frequently requested locations  \n" +
            "- Get you a copy of the folio for your stay",
        type: MessageType.Receiver),
  ];

  // ScrollController _scrollController = new ScrollController();
  FlutterTts flutterTts = FlutterTts();

  stt.SpeechToText _speech;
  bool _isListening = false;
  bool _isTalking = true;
  bool initialized = false;

  @override
  void initState() {
    super.initState();

    initializeTts();
    _speech = stt.SpeechToText();
    Wakelock.enable();
  }

  @override
  void dispose() {
    super.dispose();

    Wakelock.disable();
  }

  void initializeTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.awaitSpeakCompletion(true);

    await flutterTts
        .speak('Hi I am Athena, I can: ' +
            'Provide you with a list of recommended area restaurants' +
            'Get you directions to the most frequently requested locations' +
            'Get you a copy of the folio for your stay')
        .then((value) {
      setState(() {
        _isTalking = false;
        _listen();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Athena'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10.0);
                },
                reverse: true,
                itemCount: chatMessage.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatBubble(chatMessage: chatMessage[index]);
                },
              ),
            ),
            _isTalking
                ? Container()
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.only(right: 30, bottom: 15),
                      child: FloatingActionButton(
                        onPressed: () async {
                          //Start litsening
                          _listen();
                        },
                        child: _isListening
                            ? Loader()
                            : Icon(
                                Icons.mic,
                                color: Colors.white,
                              ),
                        backgroundColor:
                            _isListening ? Colors.white : Colors.red,
                        elevation: 0,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Future<bool> _initialize() async {
    bool available = await _speech.initialize(onStatus: (val) {
      print('onStatus: $val');
      if (val == "notListening") setState(() => _isListening = false);
    }, onError: (val) {
      setState(() => _isListening = false);
      print('onError: $val');
    });
    initialized = true;
    return available;
  }

  void _listen() async {
    if (!initialized) {
      if (!await _initialize()) print('error initializing');
    }
    if (!_isListening) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) {
          setState(() {
            _isListening = false;

            if (val.recognizedWords != '') sendSms(val.recognizedWords);
          });
        },
        listenFor: Duration(minutes: 2),
        cancelOnError: false,
        partialResults: false,
      );
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void sendSms(String text) async {
    ChatMessage newMessage =
        ChatMessage(message: text, type: MessageType.Sender);
    setState(() {
      chatMessage.insert(0, newMessage);
      _isTalking = true;
    });

    dynamic data = {"message": text, "sender": "id344"};
    dynamic reply = await API().postData(data);

    ChatMessage replyMessage =
        ChatMessage(message: reply, type: MessageType.Receiver);

    setState(() {
      chatMessage.insert(0, replyMessage);
    });
    await flutterTts.speak(reply).then((value) {
      Future.delayed(const Duration(seconds: 1), () {
        if (reply == "Here is a list of nearby restaurants.")
          Navigator.pushNamed(context, "/hotelList",
              arguments: {"type": "restaurant"});
        else if (reply ==
            "Here are some tourist locations you might be interested in.")
          Navigator.pushNamed(context, "/hotelList",
              arguments: {"type": "locations"});
        else if (reply == "Here is the folio of your stay.")
          Navigator.pushNamed(
            context,
            "/folio",
          );
        else if (reply == "Bye")
          print("bye");
        else
          _listen();
      }).then((value) {
        setState(() {
          _isTalking = false;
        });
      });
      if (reply == "Bye")
        setState(() {
          _isTalking = false;
        });
    });
  }
}
