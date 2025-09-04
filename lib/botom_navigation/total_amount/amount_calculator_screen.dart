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
      /// Background Image
      Positioned.fill(
      child: Opacity(
      opacity: 0.15, 
        child: Image.asset(
          "assets/images/ring_bg.png",
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
