import 'package:flutter/material.dart';
import  'package:flutter/src/widgets/gesture_detector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Basic Appbar
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            'Floating Action Button',
            style: TextStyle(color: Colors.white),
          ),
        ),
        // Allows custom FAB to overlay the rest of the onscreen contents
        body: Stack(
          children: [
            // other contents on the page
            // custom FAB
            TumblrFloatingActionButton(),
          ],
        ),

        //floatingActionButton: TumblrFloatingActionButton(),
      ),
    );
  }
}

// Custom FAB that resembles the colorful and draggable Tumblr FAB
class TumblrFloatingActionButton extends StatefulWidget {
  const TumblrFloatingActionButton({
    super.key,
  });

  @override
  State<TumblrFloatingActionButton> createState() => _TumblrFloatingActionButtonState();
}

class _TumblrFloatingActionButtonState extends State<TumblrFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    // stack automatically positions topStart, wrap with Positioned to override
    return Positioned(
      // typical FAB position
      bottom: 0,
      right: 0,
      // Allows us to move FAB
      child: GestureDetector(
        child: FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.redAccent,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

