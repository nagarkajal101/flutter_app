import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/text_strings.dart';
import '../signup/signup_screen.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  var emailText =TextEditingController();
  var passText =TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // makes children full-width

              children: [
            ///E-mail
            TextFormField(
              controller:  emailText,
              decoration: InputDecoration(

                  prefixIcon: Icon(Icons.mail_outline_rounded,color:  WColors.tsecondary,),
                  labelText: WTexts.email),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                //Regular Expression for Email validation
                final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                if (!emailRegExp.hasMatch(value)) {
                  return 'Invalid Email Address';
                }
                return null;
              },
              onSaved: (value) {
                _email = value ?? '';
              },
            ),

            //Spacing
            const SizedBox(
              height: 16,
            ),

            ///Password
            TextFormField(
              controller: passText,
              decoration: InputDecoration(
                  /*focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                      BorderSide(color: WColors.tdark, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                      BorderSide(color: WColors.tsecondary, width: 1)),*/

                  prefixIcon: Icon(Iconsax.password_check,color:  WColors.tsecondary,),
                  labelText: WTexts.password,
                  suffixIcon: IconButton(
                    icon: Icon(Iconsax.eye_slash,color:  WColors.tsecondary,),
                    onPressed: () {},
                  )),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
              onSaved: (value) {
                _password = value ?? '';
              },
            ),
            const SizedBox(
              height: 16,
            ),

            ///Login button
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: WColors.tprimary,
                    foregroundColor: WColors.bg1,
                  minimumSize: const Size.fromHeight(50), // full width, same height
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    print('Email: $_email , Password: $_password');
                  }
                },
                child: const Text('Login',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),)),

            ///Forget password
          Align(
              alignment: Alignment.centerRight,
              child:
              TextButton(
                onPressed: () {}, child: const Text(WTexts.forgetPassword)),
          ),

            const SizedBox(
              height: 16,
            ),

            ///Sign-In button
            ///signup
                /// Don’t have an account? + Sign Up button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",style: TextStyle(color: WColors.tdark,fontSize: 12)),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: WColors.tprimary, // text + border color
                        side: BorderSide(color: WColors.tprimary, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Navigate to SignUp Screen
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const SignupScreen() ));
                      },
                      child: const Text("Sign Up",),
                    ),
                  ],
                ),

              ]),
        ));
  }
}
