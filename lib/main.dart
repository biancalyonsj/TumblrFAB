import 'package:flutter/material.dart';

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
            // custom FAB
            TumblrFloatingActionButton(),
          ],
        ),
      ),
    );
  }
}

// Custom FAB that resembles the colorful and draggable Tumblr FAB
class TumblrFloatingActionButton extends StatefulWidget {
  const TumblrFloatingActionButton({super.key});

  @override
  State<TumblrFloatingActionButton> createState() =>
      _TumblrFloatingActionButtonState();
}
  // set the initial position to topStart of the stack
  Offset _position = Offset.zero;

class _TumblrFloatingActionButtonState
    extends State<TumblrFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    // FAB native padding
    // https://m2.material.io/components/buttons-floating-action-button#specs
    final floatingActionButtonPadding = 16.0;
    // stack automatically positions topStart, wrap with Positioned to override
    return Positioned(
      // set the FAB position to native location
      right: floatingActionButtonPadding - _position.dx,
      bottom: floatingActionButtonPadding - _position.dy,

      // Allows us to track user interaction with the FAB
      child: GestureDetector(
        // update FAB position to where the user is dragging the button
        onPanUpdate: (details) {
          setState(() {
            _position += details.delta;
          });
        },
        // return to the initial/native FAB position
        onPanEnd: (details) {
          setState(() {
            _position = Offset.zero;
          });
        },
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
