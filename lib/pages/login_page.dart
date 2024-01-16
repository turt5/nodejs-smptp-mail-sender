import 'dart:convert';

import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:rio_chatbot/main.dart';
import 'package:rio_chatbot/pages/home.dart';
import 'package:rio_chatbot/pages/signup_page.dart';
import 'package:rio_chatbot/values/size.dart';
import 'package:rio_chatbot/widgets/coming_soon.dart';
import 'package:rio_chatbot/widgets/customDialog.dart';
import 'package:rio_chatbot/widgets/custom_textfield_Filled.dart';
import 'package:http/http.dart' as http;
import '../values/fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Extra.primaryBg, // Set your desired color here
        statusBarIconBrightness:
            Brightness.dark, // Change the status bar icons color
        systemNavigationBarColor: Extra.primaryBg,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              // color: Colors.red,
              child: Column(
                children: [
                  Container(
                    // color: Colors.red,
                    width: Xtra.getScreenWidth(context),
                    height: Xtra.getScreenHeight(context) * 0.32,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 150,
                              width: Xtra.getScreenWidth(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: CupertinoColors.activeBlue,
                              ),
                              child: LottieBuilder.asset(
                                  'assets/animations/animation3.json')),
                          const Padding(
                            padding: EdgeInsets.only(
                                top: 30, bottom: 10, left: 30, right: 30),
                            child: Text(
                              'Welcome Back Dear!',
                              style: TextStyle(
                                  fontFamily: Font.ios_display,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Please login to your account to continue',
                              style: TextStyle(
                                  fontFamily: Font.ios_display,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.yellow,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    width: Xtra.getScreenWidth(context),
                    height: Xtra.getScreenHeight(context) * 0.32,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FilledTextField(
                          controller: emailController,
                          width: 350,
                          height: 100,
                          iconStart: Icon(CupertinoIcons.mail),
                          hint: 'Enter your email',
                          iconEnd: Icon(CupertinoIcons.clear_thick),
                        ),
                        FilledPasswordField(
                          controller: passwordController,
                          width: 350,
                          height: 100,
                          iconStart: Icon(Icons.password_rounded),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 350,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              String email =
                                  emailController.text.toString().trim();
                              String password =
                                  passwordController.text.toString().trim();
                              loginUser(email, password, context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CupertinoColors.activeBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: Font.ios_display,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      // color: Colors.blueAccent,
                      width: Xtra.getScreenWidth(context),
                      height: Xtra.getScreenHeight(context) * 0.32,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: Xtra.getScreenWidth(context),
                              height: 50,
                              margin: EdgeInsets.symmetric(vertical: 5),
                              // color: Colors.red,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 3,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.white, Colors.grey],
                                          stops: [0.01, 0.9],
                                          // Adjust these values to control the thickness
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(100),
                                            bottomLeft: Radius.circular(100))),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      'Or',
                                      style: TextStyle(
                                          fontFamily: Font.ios_display,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 3,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.grey, Colors.white],
                                          stops: [0.01, 0.9],
                                          // Adjust these values to control the thickness
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(100),
                                            bottomRight: Radius.circular(100))),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ComingSoonDialog();
                                    },
                                  );
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green),
                                  child: LottieBuilder.asset(
                                          'assets/animations/google.json')
                                      .frosted(
                                          blur: 30,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ComingSoonDialog();
                                    },
                                  );
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green),

                                  child: LottieBuilder.asset(
                                          'assets/animations/github.json')
                                      .frosted(
                                          blur: 30,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 50, left: 30, right: 30, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 30, right: 5, bottom: 10),
                                  child: Text("Don't have an account yet?"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 5, right: 30, bottom: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      try {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpPage()));
                                      } catch (e) {
                                        print(
                                            "Error navigating to LoginPage: $e");
                                      }
                                    },
                                    child: const Text(
                                      "Sign up",
                                      style: TextStyle(
                                          color: CupertinoColors.activeBlue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                      // Your additional content goes here
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    final String url =
        'http://136.243.50.232/~bcryptsi/index.php'; // Replace with your PHP script URL

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Successful login
        final Map<String, dynamic> data = jsonDecode(response.body);
        print('Login successful. User ID: ${data['userId']}');

        FocusScope.of(context).unfocus();

        try {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } catch (e) {
          print("Error navigating to LoginPage: $e");
        }
      } else if (response.statusCode == 401) {
        // Incorrect password
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialog(errorMessage: 'Incorrect Password');
          },
        );
        passwordController.clear();
      } else if (response.statusCode == 404) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialog(errorMessage: 'User not found');
          },
        );
        emailController.clear();
        passwordController.clear();
      } else {
        int code = response.statusCode;
        // Handle other status codes
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialog(errorMessage: 'Error: $code');
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(errorMessage: 'Error: $e');
        },
      );
    }
  }
}
