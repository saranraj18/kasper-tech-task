// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kasper_tech_task/functions/login.dart';
import 'package:kasper_tech_task/helpers/custom_button.dart';
import 'package:kasper_tech_task/helpers/dialogs.dart';
import 'package:kasper_tech_task/helpers/text_field_decoration.dart';
import 'package:kasper_tech_task/screens/home_screen.dart';
import 'package:kasper_tech_task/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;

  final TextEditingController _emailCtrl = TextEditingController(),
      _passwordCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Functionality for Login
  _loginFunction() async {
    Dialogs dialogs = Dialogs();
    dialogs.loading(context);

    try {
      final loggedIn =
          await Login.loginUser(_emailCtrl.text, _passwordCtrl.text);

      if (loggedIn == true) {
        dialogs.dismiss(context);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (ctx) => const HomeScreen(),
            ),
            (route) => false);
      } else {
        dialogs.dismiss(context);
        dialogs.error(context: context, content: loggedIn);
      }
    } catch (e) {
      dialogs.dismiss(context);
      dialogs.error(context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // UI for Login Page
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            children: [
              SizedBox(height: height * 0.03),
              Container(
                height: height * 0.35,
                alignment: Alignment.center,
                child: Image.asset("images/login_img.png"),
              ),
              Text(
                "Let's Sign you in.",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(height: height * 0.018),
              Text(
                "Welcome back.\nYou have been missed!",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey[600]),
              ),
              SizedBox(height: height * 0.06),
              TextFormField(
                controller: _emailCtrl,
                decoration: TextFieldDecoration.rRectDecoration(
                  width: width,
                  label: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Email Address';
                  }
                  if (!value.contains('@')) {
                    return 'Enter Valid Email Address';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.02),
              TextFormField(
                controller: _passwordCtrl,
                obscureText: !showPassword,
                decoration: TextFieldDecoration.rRectDecoration(
                  width: width,
                  label: 'Password',
                ).copyWith(
                    suffixIcon: IconButton(
                  icon: Icon(
                    showPassword
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                    size: width * 0.06,
                    color: Colors.grey[400],
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                )),
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text("Recover Password"),
                  ),
                ],
              ),
              SizedBox(height: height * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    ),
                    child: Text(
                      "Sign up",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),

              // Button with Validation for Login Page
              SolidButton(
                name: "Sign in",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _loginFunction();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
