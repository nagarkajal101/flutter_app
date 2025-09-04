/*import 'package:flutter/material.dart';

// Dummy Venue & Caterer models (reuse from your Venue/Catering screens)
class Venue {
  final String name;
  final int total_amount;
  final int capacity;

  Venue({required this.name, required this.total_amount, required this.capacity});
}

class Caterer {
  final String name;
  final int total_amount;
  final int capacity;
  final bool vegOnly;

  Caterer(
      {required this.name,
        required this.total_amount,
        required this.capacity,
        required this.vegOnly});
}

class BudgetCalculatorScreen extends StatelessWidget {
  final Venue? selectedVenue;
  final Caterer? selectedCaterer;

  BudgetCalculatorScreen({this.selectedVenue, this.selectedCaterer});

  @override
  Widget build(BuildContext context) {
    int total = 0;

    if (selectedVenue != null) total += selectedVenue!.total_amount;
    if (selectedCaterer != null) total += selectedCaterer!.total_amount;

    return Scaffold(
      appBar: AppBar(
        title: Text("Budget Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text("Selected Venue"),
                subtitle: Text(selectedVenue != null
                    ? "${selectedVenue!.name} - ₹${selectedVenue!.total_amount}"
                    : "No Venue Selected"),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text("Selected Caterer"),
                subtitle: Text(selectedCaterer != null
                    ? "${selectedCaterer!.name} - ₹${selectedCaterer!.total_amount}"
                    : "No Caterer Selected"),
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            Text(
              "Total Budget",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "₹$total",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Budget calculation completed!")),
                );
              },
              child: Text("Confirm"),
            )
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ever_after/controller/amount_controller.dart';

class AmountCalculatorScreen extends StatelessWidget {
  const AmountCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AmountController>();

    return Scaffold(
      appBar: AppBar(
          title: const Text("Amount Calculator"),
        backgroundColor: Colors.pink.shade200,
        automaticallyImplyLeading: false,),
      body: Stack(
        children:[
      /// Background Image (pastel floral)
      Positioned.fill(
      child: Opacity(
      opacity: 0.15, // faint background effect
        child: Image.asset(
          "assets/images/ring_bg.png", // <-- add your floral image in assets
          fit: BoxFit.cover,
        ),
      ),
    ),
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            return Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: const Text("Selected Venue"),
                    subtitle: Text(controller.selectedVenue.value != null
                        ? "${controller.selectedVenue.value!.name} - ₹${controller.selectedVenue.value!.budget}"
                        : "No Venue Selected"),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: const Text("Selected Caterer"),
                    subtitle: Text(controller.selectedCaterer.value != null
                        ? "${controller.selectedCaterer.value!.name} - ₹${controller.selectedCaterer.value!.budget}"
                        : "No Caterer Selected"),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 20),
                const Text("Total Amount",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                  "₹${controller.totalBudget}",
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            );
          }),
        ),
    ]
      ),

    );
  }
}
