import 'package:ever_after/constants/textfield_theme.dart';
import 'package:ever_after/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/app_colors.dart';
import 'firebase_options.dart';

Future <void> main()async {
  // Ensures Flutter engine is ready before Firebase initializes
  WidgetsFlutterBinding.ensureInitialized();


  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    title: 'EverAfter',
      theme: ThemeData(
        inputDecorationTheme: WTextFormFieldTheme.inputTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: WColors.tsecondary),
        useMaterial3: true,),
      home:const SplashScreen()
    );
        }
}

