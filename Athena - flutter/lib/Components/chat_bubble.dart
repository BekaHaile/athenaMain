import 'package:athena_2/Models/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChatBubble extends StatefulWidget {
  ChatMessage chatMessage;
  ChatBubble({@required this.chatMessage});
  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  DateFormat dateFormat = DateFormat("HH:mm:ss");
  String formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = dateFormat.format(DateTime.now());
    // formattedDate = DateFormat('Hms', 'en_US').parse(formattedDate).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.chatMessage.type == MessageType.Sender
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: widget.chatMessage.type == MessageType.Sender
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
            width: widget.chatMessage.type == MessageType.Sender ? 30.0 : 20.0),
        if (!(widget.chatMessage.type == MessageType.Sender)) ...[
          CircleAvatar(
            child: Image.asset(
              'assets/athen.gif',
            ),
            radius: 20.0,
          ),
          const SizedBox(width: 5.0),
        ],

        ///Chat bubbles
        Container(
          padding: EdgeInsets.only(
            bottom: 5,
            right: 5,
          ),
          child: Column(
            crossAxisAlignment: widget.chatMessage.type == MessageType.Sender
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                  minHeight: 40,
                  maxHeight: 250,
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                  minWidth: MediaQuery.of(context).size.width * 0.1,
                ),
                decoration: BoxDecoration(
                  color: widget.chatMessage.type == MessageType.Sender
                      ? Colors.red
                      : Colors.white,
                  borderRadius: widget.chatMessage.type == MessageType.Sender
                      ? BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )
                      : BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, bottom: 5, right: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                        widget.chatMessage.type == MessageType.Sender
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          widget.chatMessage.message,
                          style: TextStyle(
                            color: widget.chatMessage.type == MessageType.Sender
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.done_all,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                formattedDate,
                style: TextStyle(
                    fontSize: 12, color: Colors.black.withOpacity(0.5)),
              )
            ],
          ),
        ),
        if (widget.chatMessage.type == MessageType.Sender) ...[
          const SizedBox(width: 5.0),
          CircleAvatar(
            child: Icon(Icons.person),
            radius: 10.0,
          ),
        ],
        SizedBox(
            width: widget.chatMessage.type == MessageType.Sender ? 20.0 : 30.0),
      ],
    );
  }
}
