import 'dart:developer';

import 'package:ever_after/botom_navigation/navigation_menu.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/helpers/dialogs.dart';
import '../../../constants/text_strings.dart';
import '../google_button/google_signin.dart';
import '../widgets_auth/form_divider.dart';
import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  ///google button click
    handleGoogleBtnClick(){

    //for showing progress bar
    Dialogs.showLoading(context);
    signInWithGoogle(context).then((user){
      //for hiding progress bar
      Navigator.pop(context);
      if(user != null){
        ///for printing in console
        log('\nUser:${user.user}');
        log('\nUserAdditionalInfo:${user.additionalUserInfo}');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const NavigationMenu()),
        );
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: WColors.bg1.withOpacity(0.8),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  children: [
                    ///Logo,title
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Image(
                        image: AssetImage('assets/images/wedding_rings.png'),
                        height: 150,
                        width: 150,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        WTexts.loginTitle,
                        style: TextStyle(
                            color: WColors.tdark,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),

                    ///Form
                    const LoginForm(),

                    ///divider
                    const WFormDivider(dividerText: 'Or Sign-in with'),

                    const SizedBox(
                      height: 16,
                    ),

                    ///Footer
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: WColors.tprimary)),
                      child: IconButton(
                          onPressed: () {
                                handleGoogleBtnClick();
                          },
                          icon: Image.asset(
                            'assets/images/google_icon.png',
                            height: 50,
                            width: 50,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
