import 'package:flutter/material.dart';
import '../../../../core/animateroute.dart';
import '../../../../core/custom_widgets/custom_button.dart';
import '../../../../core/custom_widgets/custom_text_form_field.dart';
import '../../../../core/general_screens/nav_bar_screen.dart';
import '../../../register/presentation/screens/register_screen.dart';
import '../../data/repo/login_sql.dart';
import '../../data/repo/sql_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final db = LoginProvider();
  bool isLogin = false;
  LoginProvider users = LoginProvider();
  late LoginModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: Container()),
                const Text(
                  "Enter your account",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Welcome back to your account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                CustomTextFormField(
                  controller: userName,
                  hintText: "Enter your full name",
                  obscureTex: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your username";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                CustomTextFormField(
                  controller: password,
                  hintText: "Enter your password",
                  obscureTex: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 48,
                ),
                CustomButton(
                  label: "Login",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pushAndRemoveUntil(
                          SlideRightTransition(page: const NAVBarScreen()),
                              (route) => false);
                      print('UserName: ${userName.text}');
                      print('Password: ${password.text}');
                    }
                  },
                ),
                Expanded(child: Container()),
                isLogin
                    ? const Text(
                        "Username or Password not correct",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    : const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              SlideRightTransition(page: const Register()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
