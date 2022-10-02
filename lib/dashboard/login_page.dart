import 'package:flutter/material.dart';
import '../common/app_constant.dart';
import '../common/button_widget.dart';
import '../common/circular_logo_widget.dart';
import '../common/textform_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final height = size.height;

    var sizedBox = SizedBox(
      height: height * 0.02,
    );

    void dismisskeyboard() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        return currentFocus.unfocus();
      }
    }

    return GestureDetector(
      onTap: dismisskeyboard,
      child: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffDEE1E4),
                    ),
                  ),
                  Container(
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      color: AppConstant.primaryColor,
                    ),
                  ),
                  //LoginCard
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.035,
                      horizontal: size.width * 0.055,
                    ),
                    margin: EdgeInsets.only(
                      top: size.height * 0.25,
                      left: size.width * 0.06,
                      right: size.width * 0.06,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffF9F6F6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            color: AppConstant.secondaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        sizedBox,
                        MyFormField(
                          textCapitalization: TextCapitalization.none,
                          icon: Icons.email,
                          hintText: 'Enter your email',
                          controller: emailController,
                          validator: (email) {
                            return null;
                          },
                        ),
                        sizedBox,
                        MyFormField(
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.none,
                          controller: passwordController,
                          icon: Icons.lock,
                          hintText: 'Enter your password',
                        ),
                        sizedBox,
                        ButtonWidget(primaryColor: AppConstant.primaryColor),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Color(0xffA1A0A0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03),
                              child: const Text('OR',
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                            ),
                            const Expanded(
                              child: Divider(
                                color: Color(0xffA1A0A0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatarLogo(logoUrl: AppConstant.googleLogo),
                            CircleAvatarLogo(logoUrl: AppConstant.fbLogo),
                            CircleAvatarLogo(logoUrl: AppConstant.twitterLogo),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              sizedBox,
              const Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              sizedBox,
              Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppConstant.primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
