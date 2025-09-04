import 'package:ever_after/constants/helpers/dialogs.dart';
import 'package:ever_after/screens/auth/login/login_screen.dart';
import 'package:ever_after/screens/budget_suggestion/budget_suggestion_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';
import 'countdown_card_wedding.dart';
import 'countdown_setup/setup_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// STATE VARIABLES
  String? bride;
  String? groom;
  DateTime? weddingDate;

  // FUNCTION TO OPEN POPUP
  void _openSetupDialog() async {
    final result = await showDialog(
      context: context,
      builder: (_) => const WeddingSetupDialog(),
    );

    if (result != null && result is Map) {
      setState(() {
        bride = result["bride"];
        groom = result["groom"];
        weddingDate = result["date"];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.pinkAccent.shade200,
          onPressed: _openSetupDialog,
        child: const Icon(Iconsax.edit),
        ),
      appBar: AppBar(
        title: const Text("Wedding Planner"),
        backgroundColor: Colors.pink.shade200,
actions: [IconButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (_)=>const BudgetSuggestionScreen()));
    }, icon: const Icon(Icons.note_alt_outlined,color: Colors.purple,)
)
      ],

    ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pastel_pink_flower_background.jpeg"), // floral background
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Iconsax.user, size: 40, color: Colors.pink),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome, User",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Iconsax.user),
              title: const Text("Profile"),
              onTap: () {
                // Navigate to profile screen
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.setting),
              title: const Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Iconsax.logout),
              title: const Text("Logout"),
              onTap: () async {
                Dialogs.showLoading(context);
                //signout from app
                await FirebaseAuth.instance.signOut().then((value) async {
                  await GoogleSignIn().signOut().then((value){
                    Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LoginScreen()));
                  });

                });
              },
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          /// Background Image (pastel floral)
          Positioned.fill(
            child: Opacity(
              opacity: 0.15, // faint background effect
              child: Image.asset(
                "assets/images/pastel_pink_flower_background.jpeg", 
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Logo image (couple)
          Positioned.fill(
            child: Opacity(
              opacity: 1, 
              child: Image.asset(
                "assets/images/wedding-couple.png", 
                fit: BoxFit.contain,
              ),
            ),
          ),
          
          if (bride != null && groom != null && weddingDate != null)
            Align(
              alignment: Alignment.center,
              child: WeddingCountdownCard(
                bride: bride!,
                groom: groom!,
                weddingDate: weddingDate!,
              ),
            )
          else
            const Center(

            ),
        ],
      ),
    );
  }
}


