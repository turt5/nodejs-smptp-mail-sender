import 'dart:convert';
import 'dart:io';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:rio_chatbot/others/mailer.dart';
import 'package:rio_chatbot/others/verification_generator.dart';
import 'package:rio_chatbot/values/size.dart';
import 'package:rio_chatbot/widgets/customDialog.dart';
import 'package:rio_chatbot/widgets/custom_textfield2.dart';
import 'package:rio_chatbot/widgets/custom_textfield_Filled.dart';
import 'package:rio_chatbot/widgets/email-sent-dialog.dart';
import 'package:rio_chatbot/widgets/loading_dialog.dart';
import 'package:rio_chatbot/widgets/registration_success_popup.dart';

import '../others/mail_verifier.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController verificationController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();
  late final String generatedCode;

  File? image;

  @override
  Widget build(BuildContext context) {
    double width = Xtra.getScreenWidth(context);
    double width2 = (Xtra.getScreenWidth(context) > 500)
        ? 350
        : Xtra.getScreenWidth(context);
    double height = Xtra.getScreenHeight(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
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
                    height: height * 0.90,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: LottieBuilder.asset("assets/animations/create-account.json"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 30, bottom: 30),
                            child: Text(
                              'Create your account',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          CustomTextInput(
                            hint: 'Name',
                            width: 350,
                            controller: nameController,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextInput(
                                  hint: 'Email',
                                  width: 220,
                                  controller: emailController,
                                ),
                                Container(
                                  width: 120,
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      String email =
                                      emailController.text.toString().trim();
                                      if (email.isNotEmpty) {
                                        String subject =
                                            "Regarding Rio Signup Verification Code";
                                        generatedCode = generateRandomNumber();
                                        String body =
                                            "Dear User,\n\nHere's your verification code: $generatedCode\n\nThank you, \nRio Admin";

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return LoadingDialog();
                                          },
                                        );

                                        if (await verifyEmail(email)) {
                                          sendMail(email, subject, body);
                                          Navigator.of(context).pop();
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return EmailSent();
                                            },
                                          );
                                        } else {
                                          Navigator.of(context).pop();
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ErrorDialog(
                                                  errorMessage:
                                                  "Email doesn't exists, Please enter a valid email!");
                                            },
                                          );
                                        }
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ErrorDialog(
                                                errorMessage:
                                                "Email cannot be empty!");
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      'Send Code',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      CupertinoColors.activeBlue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomTextInput(
                            hint: 'Verification Code',
                            width: 350,
                            controller: verificationController,
                          ),
                          FilledPasswordField(width: 350, height: 50, iconStart: Icon(Icons.password), controller: cPassController),
                          FilledPasswordField(width: 350, height: 50, iconStart: Icon(Icons.password), controller: cPassController, hint: 'Confirm password',),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: width2 - 60,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () async {
                                pickImage();
                              },
                              child: Text('Pick Image',style: TextStyle(
                                  color: Colors.white
                              ),),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: CupertinoColors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: width2 - 60,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                String name =
                                nameController.text.toString().trim();
                                String email =
                                emailController.text.toString().trim();
                                String verificationCode =
                                verificationController.text.toString().trim();
                                String password =
                                passController.text.toString().trim();
                                String cPassword =
                                cPassController.text.toString().trim();

                                if (name.isNotEmpty &&
                                    email.isNotEmpty &&
                                    verificationCode.isNotEmpty &&
                                    verificationCode == generatedCode &&
                                    password.isNotEmpty &&
                                    cPassword.isNotEmpty) {
                                  if (verificationCode == generatedCode) {
                                    if (password == cPassword) {
                                      
                                      if(image!=null){
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return LoadingDialog();
                                          },
                                        );
                                        createUser(name, email, password);
                                      }else{
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ErrorDialog(errorMessage: 'Please select your profile picture!');
                                          },
                                        );
                                      }
                                     
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ErrorDialog(
                                              errorMessage:
                                              "Password didn't match");
                                        },
                                      );
                                    }
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ErrorDialog(
                                            errorMessage:
                                            "Verification code didn't match");
                                      },
                                    );
                                  }
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ErrorDialog(
                                          errorMessage:
                                          'Please fill all the data correctly!');
                                    },
                                  );
                                }
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

  Future<void> pickImage() async {
    // Request storage permission
    var status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      // Permission denied, handle accordingly
      return;
    }

    try {
      // Use ImagePicker as before
      print('Before image picking');
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      print('After image picking');
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    } catch (e) {
      print('Error picking image: $e');
    }
  }



  Future<void> createUser(String name, String email, String password) async {
    final String apiUrl = 'http://136.243.50.232/~bcryptsi/index.php';

    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['password'] = password;

    if (image != null) {
      var mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream';
      var file = await http.MultipartFile.fromPath(
        'profilePicture',
        image!.path,
        contentType: MediaType.parse(mimeType),
      );
      request.files.add(file);
    }

    try {
      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print('User created successfully. UserID: ${responseData['id']}');
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog();
          },
        );
      } else {
        print('Failed to create user. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    } catch (error) {
      print('Error during request: $error');
    }
  }
}
