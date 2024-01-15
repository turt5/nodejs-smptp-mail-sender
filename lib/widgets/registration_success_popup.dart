import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../pages/login_page.dart';

class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = _createController();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/animations/registration_success.json',
              controller: _controller,
              onLoaded: (composition) {
                _playAnimationOnce();
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                try {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                } catch (e){
                  print("Error navigating to LoginPage: $e");
                };
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CupertinoColors.activeBlue,
              ),
              child: Text('Continue',style: TextStyle(
                color: Colors.white
              ),),
            ),
          ],
        ),
      ),
    ).frosted(
      blur: 20,
      borderRadius: BorderRadius.circular(10)
    );
  }

  AnimationController _createController() {
    return AnimationController(vsync: this, duration: Duration(seconds: 2),);
  }

  void _playAnimationOnce() {
    _controller.forward().whenComplete(() {
      _controller.dispose(); // Dispose the controller after animation completion
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }
}
