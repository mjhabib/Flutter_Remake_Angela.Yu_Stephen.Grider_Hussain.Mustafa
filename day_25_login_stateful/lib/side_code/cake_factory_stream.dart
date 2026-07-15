// And example of how a 'stream' works in Dart
// This is how to think about streams: a sequence of events flowing through a pipeline, where each operator (map, where, transform, etc.) acts like another machine on the assembly line.

import 'dart:async';

/// The finished product.
class Cake {}

/// A customer's order.
class Order {
  String type;
  Order({required this.type});
}

void main() {
  // The factory receives incoming orders.
  final controller = StreamController<Order>();

  // Customer places an order.
  final newOrder = Order(type: 'chocolate');

  // The baker receives a cake type (String)
  // and either bakes a Cake or reports an error.
  final newBaker = StreamTransformer<String, Cake>.fromHandlers(
    handleData: (cakeType, sink) {
      if (cakeType == 'chocolate') {
        sink.add(Cake()); // Send a cake to the next stage.
      } else {
        sink.addError('I can not bake that type of cake!');
      }
    },
  );

  // Listen to every cake that comes out of the factory.
  controller.stream
      // Convert an Order object into its cake type.
      .map((order) => order.type)
      // Pass the cake type to the baker.
      .transform(newBaker)
      // Receive either a baked cake or an error.
      .listen(
        (cake) {
          print('Here is your $cake');
        },
        onError: (err) {
          print('Error: $err');
        },
      );

  // Send the customer's order into the factory.
  controller.sink.add(newOrder);

  // Close the factory when we're done.
  controller.close();
}

/* 
Some common real-world use cases:

// Chat app:
// Every new message arrives through a stream.

// Weather app:
// Temperature updates arrive continuously from a server.

// GPS navigation:
// Your current location changes every few seconds.

// Downloading a file:
// Small chunks of data arrive until the download finishes.

// Music player:
// Audio data is streamed continuously to the speakers.

// Stock market:
// Stock prices keep updating throughout the day.

// Flutter UI:
// A button tap, keyboard input, or screen gesture is an event in a stream.

// IoT sensors:
// A temperature sensor sends a new reading every second.
 */
