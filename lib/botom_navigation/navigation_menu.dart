import 'package:ever_after/botom_navigation/total_amount/amount_calculator_screen.dart';
import 'package:ever_after/botom_navigation/catering/catering_screen.dart';
import 'package:ever_after/botom_navigation/checklist/checklist_screen.dart';
import 'package:ever_after/botom_navigation/home/home_screen.dart';
import 'package:ever_after/botom_navigation/venue/venue_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/amount_controller.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationController());
    
    final amountController = Get.put(AmountController());

    return Scaffold(
      body: Obx(()=> navController.screens[navController.selectedIndex.value]),
      bottomNavigationBar: Obx(
            ()=> NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: Colors.white,
          indicatorColor: Colors.pink.shade100,
          selectedIndex: navController.selectedIndex.value,
          onDestinationSelected: (index)=>navController.selectedIndex.value = index,

          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              selectedIcon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.checklist),
              selectedIcon: Icon(Icons.checklist_rtl),
              label: "Checklist",
            ),
            NavigationDestination(
              icon: Icon(Icons.maps_home_work),
              selectedIcon: Icon(Icons.maps_home_work_outlined),
              label: "Venue",
            ),
            NavigationDestination(
              icon: Icon(Icons.emoji_food_beverage),
              selectedIcon: Icon(Icons.emoji_food_beverage_outlined),
              label: "Catering",
            ),
            NavigationDestination(
              icon: Icon(Icons.calculate),
              selectedIcon: Icon(Icons.calculate_outlined),
              label: "Amount",
            ),
          ],
        ),
      ),
    );
  }
}

/// Active screen content
class NavigationController extends GetxController{
  final Rx<int> selectedIndex= 0.obs;

// Screens for each destination
  final List<Widget> screens = [
    const HomeScreen(),
    const ChecklistScreen(),
    VenueScreen(),
    CateringScreen(),
    const AmountCalculatorScreen()
  ];
}
