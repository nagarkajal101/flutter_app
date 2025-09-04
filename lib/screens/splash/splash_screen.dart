import 'dart:developer';
import 'dart:math' show pi;

import 'package:ever_after/botom_navigation/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../auth/login/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
   ///
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    //animation setup
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this)..repeat();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);


    //Navigation after splashscreen
    Future.delayed(const Duration(seconds: 3), () {

      if(FirebaseAuth.instance.currentUser!= null){
        ///for printing in console
        log('\nUser:${FirebaseAuth.instance.currentUser}');
        //to Homescreen
        if (!mounted) return; // Check if widget is still in tree
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const NavigationMenu()),
        );
      }else{
        // to LoginScreen
      if (!mounted) return; // Check if widget is still in tree
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );}
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// UI here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: WColors.bg5.withOpacity(0.8),
        child: Center(
          child: MatrixTransition(
            animation: _animation,
            onTransform: (double value) {
              return Matrix4.identity()
                ..setEntry(3, 2, 0.004)
                ..rotateY(pi * 2.0 * value);
            },
            child: Padding(padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/wedding-couple.png',height: 100,width: 100),

          ),
        ),
            ),
      )
    );
  }
}

