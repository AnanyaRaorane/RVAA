import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rvaa_1/features/auth/controller/auth_controller.dart';
import 'package:rvaa_1/features/auth/view/register.dart';
import 'package:rvaa_1/components/appbar.dart';
import 'package:rvaa_1/components/custom_bottom_nav.dart';
import 'package:rvaa_1/components/text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Hero(
        tag: 'rvaa',
        child: Padding(
          padding: const EdgeInsets.only(bottom: 45),
          child: SvgPicture.asset(
            'assets/svgs/rvaa_logo.svg',
            height: Get.height * 0.05,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthAppbar(
                pageName: 'Sign in',
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              const TextfieldsWidget(
                fieldName: 'Phone Number',
                keyboardType: TextInputType.phone,
                iconName: Icon(Icons.phone_outlined),
                isObscure: false,
              ),
              const TextfieldsWidget(
                keyboardType: TextInputType.number,
                fieldName: 'Vehicle ID',
                iconName: Icon(Icons.car_rental),
                isObscure: false,
              ),
              TextfieldsWidget(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                fieldName: 'Email',
                iconName: Icon(Icons.email_outlined),
                isObscure: false,
              ),
              TextfieldsWidget(
                controller: passwordController,
                fieldName: 'Enter Password',
                isObscure: true,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'forgot password',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff1773B6),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                width: Get.width * 0.8,
                height: Get.height * 0.07,
                child: Hero(
                  tag: "signup",
                  child: ElevatedButton(
                    onPressed: () async {
                      final message = await AuthController().login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      if (message!.contains('Success')) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const CustomBottomNav(),
                          ),
                        );
                      }
                      debugPrint(message.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                      debugPrint(message.toString());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  text: 'not a user yet?   ',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xff1773B6),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Replace this with the action you want to perform on tap
                          debugPrint('Sign in text tapped!');
                          // For navigation example:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  signinwithGoogle();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: SizedBox(
                  width: Get.width * 0.7,
                  height: Get.height * 0.07,
                  child: const Center(
                    child: Text(
                      'Sign up with Google',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.28,
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
