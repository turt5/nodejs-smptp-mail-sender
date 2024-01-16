import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../pages/login_page.dart';

class ComingSoonDialog extends StatefulWidget {
  @override
  _ComingSoonDialogState createState() => _ComingSoonDialogState();
}

class _ComingSoonDialogState extends State<ComingSoonDialog> {
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
            SizedBox(
              width: 200,
              height: 200,
              child: Lottie.asset(
                'assets/animations/coming-soon.json',
                repeat: true,
                onLoaded: (composition) {},
              ),
            ),
            const SizedBox(height: 10.0),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CupertinoColors.activeBlue,
              ),
              child: Text('Continue', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    ).frosted(
      blur: 20,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
