// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kasper_tech_task/functions/login.dart';
import 'package:kasper_tech_task/helpers/custom_button.dart';
import 'package:kasper_tech_task/helpers/dialogs.dart';
import 'package:kasper_tech_task/helpers/text_field_decoration.dart';
import 'package:kasper_tech_task/screens/home_screen.dart';
import 'package:kasper_tech_task/screens/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  // TextEditing Controllers for the TextField
  final TextEditingController _fNameCtrl = TextEditingController(),
      _lNameCtrl = TextEditingController(),
      _phoneNoCtrl = TextEditingController(),
      _addressCtrl = TextEditingController(),
      _usernameCtrl = TextEditingController(),
      _passwordCtrl = TextEditingController(),
      _emailCtrl = TextEditingController(),
      _passwordCheckCtrl = TextEditingController();

  // Functionality for Signing Up
  _signupFunction() async {
    Dialogs dialogs = Dialogs();
    dialogs.loading(context);

    Object body = {
      "email": _emailCtrl.text,
      "password": _passwordCtrl.text,
      "passwordCheck": _passwordCheckCtrl.text,
      "first_name": _fNameCtrl.text,
      "last_name": _lNameCtrl.text,
      "username": _usernameCtrl.text,
      "phone_number": _phoneNoCtrl.text,
    };

    try {
      final loggedIn = await Login.signUpUser(body);

      if (loggedIn) {
        dialogs.dismiss(context);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (ctx) => const HomeScreen(),
            ),
            (route) => false);
      } else {
        dialogs.dismiss(context);
        dialogs.error(context: context);
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

    // UI for Sign Up Page
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            children: [
              SizedBox(height: height * 0.03),
              Text(
                "Let's Sign up.",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(height: height * 0.018),
              Text(
                "Welcome!\nLet's start a new beginning.",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey[600]),
              ),
              SizedBox(height: height * 0.03),
              TextFormField(
                controller: _fNameCtrl,
                decoration: TextFieldDecoration.rRectDecoration(
                  width: width,
                  label: 'First Name',
                ),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter First Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.02),
              TextFormField(
                controller: _lNameCtrl,
                decoration: TextFieldDecoration.rRectDecoration(
                  width: width,
                  label: 'Last Name',
                ),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Last Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.02),
              TextFormField(
                controller: _phoneNoCtrl,
                decoration: TextFieldDecoration.rRectDecoration(
                  width: width,
                  label: 'Phone No.',
                ).copyWith(counterText: ''),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                maxLength: 10,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Phone Number';
                  }
                  if (value.length != 10) {
                    return 'Enter 10 digits Number';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.02),
              TextFormField(
                controller: _addressCtrl,
                decoration: TextFieldDecoration.rRectDecoration(
                  width: width,
                  label: 'Address\n\n\n',
                ),
                keyboardType: TextInputType.streetAddress,
                textInputAction: TextInputAction.next,
                maxLines: 4,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Address';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.02),
              TextFormField(
                controller: _usernameCtrl,
                decoration: TextFieldDecoration.rRectDecoration(
                  width: width,
                  label: 'Username',
                ),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Username';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.02),
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
                decoration: TextFieldDecoration.rRectDecoration(
                  width: width,
                  label: 'Password',
                ),
                obscureText: true,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.02),
              TextFormField(
                controller: _passwordCheckCtrl,
                decoration: TextFieldDecoration.rRectDecoration(
                  width: width,
                  label: 'Re-enter Password',
                ),
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Password';
                  }
                  // ignore: unrelated_type_equality_checks
                  if (value != _passwordCtrl.text) {
                    return "Password doesn't match";
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    child: Text(
                      "Sign in",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),

              // Button for Sign Up
              SolidButton(
                name: "Sign up",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _signupFunction();
                  }
                },
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
