import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flash_chat/components/message_bubble.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({
    super.key,
    required this._firestore,
    required this.loggedInUser,
  });

  final FirebaseFirestore _firestore;
  final User? loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.grey),
          );
        }

        final messages = snapshot.data?.docs.reversed;
        List<MessageBubble> messageBubbles = [];

        for (var message in messages!) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');
          final currentUser = loggedInUser?.email;

          final messageBubble = MessageBubble(
            messageText: messageText,
            messageSender: messageSender,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }

        // FIX layout 2: Since it is a direct child of the main Column, Expanded works perfectly!
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
