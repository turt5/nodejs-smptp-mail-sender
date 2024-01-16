import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog extends StatefulWidget {
  @override
  _ComingSoonDialogState createState() => _ComingSoonDialogState();
}

class _ComingSoonDialogState extends State<LoadingDialog> {
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
              width: 100,
              height: 100,
              child: Lottie.asset(
                'assets/animations/loading.json',
                repeat: true,
                onLoaded: (composition) {},
              ),
            ),
            const SizedBox(height: 10.0),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Sending, Please wait!'
            ),),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    ).frosted(
      blur: 20,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
