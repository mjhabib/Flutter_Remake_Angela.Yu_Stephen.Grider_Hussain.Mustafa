import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() async {
  await dotenv.load();
  final apiKey = dotenv.get('API_KEY');
  final authDomain = dotenv.get('AUTH_DOMAIN');
  final projectId = dotenv.get('PROJECT_ID');
  final storageBucket = dotenv.get('STORAGE_BUCKET');
  final messagingSenderId = dotenv.get('MESSAGING_SENDER_ID');
  final appId = dotenv.get('APP_ID');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb
        ? FirebaseOptions(
            apiKey: apiKey,
            authDomain: authDomain,
            projectId: projectId,
            storageBucket: storageBucket,
            messagingSenderId: messagingSenderId,
            appId: appId,
          )
        : null,
  );

  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        // '/chat': (context) => ChatScreen(),
      },
    );
  }
}

// Note: since typing strings like '/chat' is not typo-proof or error-proof, we can instead use a Static identifier in each file like this: "static String id = 'chat';" and call each identifier whenever we need them like in our routes like this: "ChatScreen.id".
// This way we can't make any typos and since we're using the 'static' keyword, we're not calling the whole class, so we're not wasting recourses.
