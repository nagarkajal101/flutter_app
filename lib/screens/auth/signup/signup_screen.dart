import 'package:ever_after/screens/auth/signup/signup_form.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/text_strings.dart';
import '../widgets_auth/form_divider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: WColors.bg1.withOpacity(0.8),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top:40.0),
              child: Column(
                children: [
                  ///Logo,title
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Image(
                      image: AssetImage('assets/images/wedding_rings.png'),
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      WTexts.signupTitle,
                      style: TextStyle(
                          color: WColors.tdark,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),

                  ///Form
                  const WSignupForm(),

                  ///divider
                  const
                  WFormDivider(dividerText: 'Or Sign-up with'),

                  const SizedBox(
                    height: 16,
                  ),

                  ///Footer
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: WColors.tprimary)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/google_icon.png',
                            height: 50,
                            width: 50,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
