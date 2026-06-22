import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flash_chat/components/message_stream.dart';
import 'package:flash_chat/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const String id = 'chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  String? messageText;
  late bool _isLoading = false;
  final messageTextController = TextEditingController();

  void getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
  }

  Future<void> saveMessageToDB() async {
    // clear the TextField after clicking on the Send button
    messageTextController.clear();

    // 1. Turn on the spinner
    setState(() {
      _isLoading = true;
    });

    try {
      if (messageText != null) {
        await _firestore.collection('messages').add({
          'text': messageText,
          'sender': loggedInUser?.email,
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: Message can not be empty!')),
        );
      }
    } catch (e) {
      {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
      print(e);
    } finally {
      // 2. Turn off the spinner whether it succeeds or fails
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Future<void> getMessagesFromDB() async {
  // this method works but the only problem is, whenever I want to get the latest messages (pulling data), I need to call this method, and since this is a Chat app, I don't know when someone will post a new message, so it doesn't make any sense either to call this method every few seconds!

  // final messages = await _firestore.collection('messages').get();
  // for (var message in messages.docs) {
  //   print(message.data());
  // }

  // void getMessagesFromDB() async {
  // That's why we need to get a Stream of messages (pushing data over) which will notify and trigger that there is a new message to show:
  //   await for (var snapshot in _firestore.collection('messages').snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
        title: Text('⚡️ Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // FIX layout 1: We moved the StreamBuilder OUT of the bottom Row and placed it right here
            MessageStream(firestore: _firestore, loggedInUser: loggedInUser),

            // This Container holds ONLY the text input bar and send button
            Container(
              decoration: messageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // The TextField safely takes up the rest of the horizontal row space
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      autocorrect: true,
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      onSubmitted: (_) {
                        saveMessageToDB();
                      },
                      decoration: messageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: saveMessageToDB,
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.lightBlueAccent,
                            ),
                          )
                        : Text('Send', style: sendButtonTextStyle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
