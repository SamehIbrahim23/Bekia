import 'package:flutter/material.dart';
import 'package:test_project/main.dart';

import '../../ui/animations/fade_animation.dart';
import '../../ui/themes/app_color.dart';
import '../../ui/themes/font.dart';

class PasswordRecoveryPage extends StatefulWidget {
  PasswordRecoveryPage({super.key});

  @override
  State<PasswordRecoveryPage> createState() => PasswordRecoveryPageState();
}

class PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          width: context.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Theme.of(context).primaryColorLight,
                AppColor.bodySecondaryColor,
                AppColor.bodyPrimaryColor,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      delay: 0.6,
                      child: Text(
                        "Password Recovery",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FadeAnimation(
                      delay: 0.7,
                      child: Text(
                        "Enter your email to reset your password",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        FadeAnimation(
                          delay: 0.8,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).secondaryHeaderColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(142, 245, 102, 59),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, top: 3, bottom: 3),
                                    child: TextFormField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        border: InputBorder.none,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your email';
                                        } else if (!emailRegExp
                                            .hasMatch(value)) {
                                          if (!value.contains("@gmail.com")) {
                                            return "Your email must have '@gmail.com'";
                                          } else {
                                            return 'Enter a valid email';
                                          }
                                        }
                                        return null;
                                      },
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        FadeAnimation(
                          delay: 0.9,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.width * 0.1,
                              vertical: 14.0,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  // Logic to send password reset link
                                  print(
                                      "Password reset link sent to ${emailController.text}");
                                  // Navigate to a confirmation screen or show a success message
                                } else {
                                  print("Not Valid");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).primaryColorLight,
                                minimumSize: Size(context.width * 0.5, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Text(
                                'Send Reset Link',
                                style: TextStyle(
                                    fontFamily: Font.semiBold,
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
