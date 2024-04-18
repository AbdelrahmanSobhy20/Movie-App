import 'package:flutter/material.dart';
import '../../../../core/animateroute.dart';
import '../../../../core/custom_widgets/custom_button.dart';
import '../../../../core/custom_widgets/custom_text_form_field.dart';
import '../../../../core/general_screens/nav_bar_screen.dart';
import '../../../login/presentation/screens/login_screen.dart';
import '../../../../core/general_account_sql.dart';
import '../../../../core/sql_model_register.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AccountProvider users = AccountProvider();

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
                  "Create an account",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Let’s create your account",
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
                  "Email",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                CustomTextFormField(
                  controller: email,
                  hintText: "Enter your email",
                  obscureTex: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
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
                  height: 24,
                ),
                const Text(
                  "Repeat Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                CustomTextFormField(
                  controller: rePassword,
                  hintText: "Repeat your password",
                  obscureTex: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please repeat your password";
                    } else if (password.text != rePassword.text) {
                      return "Please enter the same password";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 48,
                ),
                CustomButton(
                    label: "Register",
                    onPressed: () {
                      users.insert(AccountModel(
                          username: userName.text,
                          email: email.text,
                          password: password.text));
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushAndRemoveUntil(
                            SlideRightTransition(
                                page: const NAVBarScreen()),
                                (route) => false);
                        print('UserName: ${userName.text}');
                        print('Email: ${email.text}');
                        print('Password: ${password.text}');
                      }
                    }),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(SlideRightTransition(page: LoginScreen()));
                        },
                        child: Text(
                          "Login",
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
