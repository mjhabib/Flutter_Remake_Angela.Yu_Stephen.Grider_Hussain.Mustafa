import 'package:flash_chat/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  // 'static' keyword can be implemented for class-wide variables and methods
  // Now whenever I needed the id of this class/file, I don't have to create an object and I will save resources by getting this id this way: "WelcomeScreen.id".
  static const String id = 'welcome';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

// mixin
// the class below not only extends (inherits) from another class, but it also can uses the features (properties, methods, etc...) from one or more mixing classes when we use the keyword 'with'
// to define a mixin, all we have to do is to replace the keyword 'class' with 'mixin'
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // creating custom animation
  //
  // we need three things. 1. Ticker (it's like a counter which our animation changes with each tick). 2. Controller (it tells our animation what to do like when to start/stop or how long). 3. Animation Value (this is the thing that does the animating, for example changing the size in a specific range).
  //
  // if we had multiple animations, we use 'TickerProviderStateMixin' but now that we only have one, we use 'SingleTickerProviderStateMixin'
  //
  late AnimationController controller;
  // if we wanna customize our animation further, we can define this 'Animation'
  late Animation animation;

  @override
  void initState() {
    super.initState();

    // 'this' refers to our ticker (SingleTickerProviderStateMixin)
    // our animation value by default is between 0-1 but we can change it to whatever we want by defining 'lowerBound' or 'upperBound' .
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
      // upperBound: 100,
    );

    // this is how we can change our default animation (flat) to something else (like curve)
    // Important: CurvedAnimation only accepts values between 0-1 so we can't change our Bounds to other values
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    // another type of animation for colors
    // animation = ColorTween(
    //   begin: Colors.red,
    //   end: Colors.amber,
    // ).animate(controller);

    // start the animation
    controller.forward();
    // controller.reverse(from: 1);

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    // the 'addListener' will be called every time the value of the animation changes.
    // the 'setState' is required to mark the animating part dirty so we can see the changes in real-time
    controller.addListener(() {
      setState(() {});
    });
  }

  // when we're done with our animation, we better dispose it to don't waste recourses
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    // *60 -> because our value is between 0-1
                    height: animation.value * 60,
                    // height: controller.value,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w900),
                  child: AnimatedTextKit(
                    animatedTexts: [TypewriterAnimatedText('Flash Chat')],
                  ),
                ),
              ],
            ),
            SizedBox(height: 48.0),
            RoundedButton(
              label: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              label: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
