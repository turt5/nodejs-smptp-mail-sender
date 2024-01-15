import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:rio_chatbot/pages/login_page.dart';
import 'package:rio_chatbot/values/fonts.dart';
import 'package:rio_chatbot/values/size.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Rio_ChatBot(),
    theme: ThemeData(
      fontFamily: Font.ios_display
    ),
  ));
}

class Rio_ChatBot extends StatelessWidget {
  const Rio_ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Extra.primaryBg, // Set your desired color here
            statusBarIconBrightness:
            Brightness.dark, // Change the status bar icons color
            systemNavigationBarColor: Extra.primaryBg,
            systemNavigationBarIconBrightness: Brightness.dark)
    );

    double screenW=(Xtra.getScreenWidth(context)>500)?Xtra.getScreenWidth(context)*0.3-50:Xtra.getScreenWidth(context);
    
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: Extra.primaryBg,
            child: Column(
              children: [
                Container(
                  height: Xtra.getScreenHeight(context) * 0.6,
                  width: screenW,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: CupertinoColors.activeBlue,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: LottieBuilder.asset(
                      'assets/animations/lottie-ai-bot.json'),
                ),

                SizedBox(height: 10,),

                Container(
                  height: Xtra.getScreenHeight(context) * 0.3,
                  width: Xtra.getScreenWidth(context),
                  margin: EdgeInsets.all(10),
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //title
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Rio: The Personal\nConversational Companion',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: Font.ios_display,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),

                      const Padding(
                        padding: EdgeInsets.only(
                            top: 15, left: 25, right: 25, bottom: 15),
                        child: Text(
                          "Rio isn't just a chat companion it's your personal guide through a world of curiosity, wit, and surprises.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: Font.ios_display,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey
                          ),),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: screenW - 50,
                        height: 50,
                        child: ElevatedButton(onPressed: () {
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Get Started',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: Font.ios_rounded
                                ),),
                              SizedBox(width: 10,),
                              Icon(CupertinoIcons.arrow_right,
                                color: Colors.white,)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
