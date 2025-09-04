import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/text_strings.dart';
import '../login/login_screen.dart';


class WSignupForm extends StatelessWidget {
  const WSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: WTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: WTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),

            ///Username
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: WTexts.username,
                prefixIcon: Icon(Iconsax.user_edit),
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            ///Email
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: WTexts.email,
                prefixIcon: Icon(Iconsax.direct),
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            ///Phone Number
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: WTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call),
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            ///password
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: WTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: 16,
            ),


            ///SignUp Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: WColors.tprimary,
                  foregroundColor: WColors.bg1,
                  minimumSize: const Size.fromHeight(50), // full width, same height
                ),
                  onPressed: () {}, child: const Text(WTexts.createAccount,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),),
            ),

            ///already have an acount
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?",style: TextStyle(color: WColors.tdark,fontSize: 12)),
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
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const LoginScreen()));
                  },
                  child: const Text("LOGIN",),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
