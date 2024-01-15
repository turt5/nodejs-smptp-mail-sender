import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rio_chatbot/values/size.dart';
import 'package:rio_chatbot/widgets/custom_textfield2.dart';

import '../widgets/registration_success_popup.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key});

  @override
  Widget build(BuildContext context) {
    double width = Xtra.getScreenWidth(context);
    double height = Xtra.getScreenHeight(context);

    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: width,
              height: height,
              margin: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.85,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
                            child: Text(
                              'Create your account',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          CustomTextInput(hint: 'Name', width: 350,),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextInput(hint: 'Email', width: 220,),
                                Container(
                                  width: 120,
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //send code listener
                                    },
                                    child: Text(
                                      'Send Code',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: CupertinoColors.activeBlue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomTextInput(hint: 'Verification Code', width: 350,),
                          CustomTextInput(hint: 'Password', width: 350,),
                          CustomTextInput(hint: 'Confirm password', width: 350,),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: width - 60,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                //signup listener


                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomDialog();
                                  },
                                );
                              },


                              child: Text(
                                'Sign up',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CupertinoColors.activeBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
