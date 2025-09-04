import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/amount_controller.dart';

class Caterer {
  final String name;
  final int budget; // per event cost
  final int capacity; // how many people they can serve
  final bool vegOnly; // true = veg only, false = both

  Caterer({
    required this.name,
    required this.budget,
    required this.capacity,
    required this.vegOnly,
  });
}

class CateringScreen extends StatefulWidget {
  @override
  _CateringScreenState createState() => _CateringScreenState();
}

class _CateringScreenState extends State<CateringScreen> {
  List<Caterer> caterers = [
    Caterer(name: "Green Leaf Caterers", budget: 60000, capacity: 200, vegOnly: true),
    Caterer(name: "Royal Feast Catering", budget: 120000, capacity: 400, vegOnly: false),
    Caterer(name: "Pure Veg Delights", budget: 80000, capacity: 300, vegOnly: true),
    Caterer(name: "Ocean Pearl Caterers", budget: 150000, capacity: 500, vegOnly: false),
    Caterer(name: "Classic Veg Caterers", budget: 40000, capacity: 150, vegOnly: true),
    Caterer(name: "City Banquet Caterers", budget: 100000, capacity: 350, vegOnly: false),
  ];

  String sortBy = "None";
  int? selectedCapacityFilter;
  int? selectedBudgetFilter;
  bool vegOnlyToggle = false; // false = show all, true = only veg

  final List<int> capacityOptions = [100, 200, 300, 500];
  final List<int> budgetOptions = [50000, 100000, 150000, 200000];

  List<Caterer> get filteredCaterers {
    List<Caterer> filtered = caterers;

    // Veg filter
    if (vegOnlyToggle) {
      filtered = filtered.where((c) => c.vegOnly == true).toList();
    }

    // Capacity filter
    if (selectedCapacityFilter != null) {
      filtered = filtered.where((c) => c.capacity >= selectedCapacityFilter!).toList();
    }

    // Budget filter
    if (selectedBudgetFilter != null) {
      filtered = filtered.where((c) => c.budget <= selectedBudgetFilter!).toList();
    }

    // Sorting
    if (sortBy == "Budget (Low-High)") {
      filtered.sort((a, b) => a.budget.compareTo(b.budget));
    } else if (sortBy == "Budget (High-Low)") {
      filtered.sort((a, b) => b.budget.compareTo(a.budget));
    } else if (sortBy == "Capacity") {
      filtered.sort((a, b) => b.capacity.compareTo(a.capacity));
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        automaticallyImplyLeading: false,

        title: const Text("Catering Options"),
      ),
      body: Stack(
        children:[
      /// Background Image 
      Positioned.fill(
      child: Opacity(
      opacity: 0.25, 
        child: Image.asset(
          "assets/images/floral_bg.png", 
          fit: BoxFit.cover,
        ),
      ),
    ),
          Column(
          children: [
            // --- Filter Controls ---
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Veg / Both Toggle
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Veg Only"),
                      Switch(
                        activeColor: Colors.green,
                        value: vegOnlyToggle,
                        onChanged: (val) {
                          setState(() => vegOnlyToggle = val);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // Capacity Filter
                      Expanded(
                        child: DropdownButton<int?>(
                          dropdownColor: Colors.pink.shade100,

                          isExpanded: true,
                          value: selectedCapacityFilter,
                          hint: const Text("Min Capacity"),
                          items: [null, ...capacityOptions]
                              .map((cap) => DropdownMenuItem<int?>(
                            value: cap,
                            child: Text(cap == null ? "Capacity" : "≥ $cap"),
                          ))
                              .toList(),
                          onChanged: (val) {
                            setState(() => selectedCapacityFilter = val);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Budget Filter
                      Expanded(
                        child: DropdownButton<int?>(
                          dropdownColor: Colors.pink.shade100,

                          isExpanded: true,
                          value: selectedBudgetFilter,
                          hint: const Text("Max Budget"),
                          items: [null, ...budgetOptions]
                              .map((bud) => DropdownMenuItem<int?>(
                            value: bud,
                            child: Text(bud == null ? "Budget" : "≤ ₹$bud"),
                          ))
                              .toList(),
                          onChanged: (val) {
                            setState(() => selectedBudgetFilter = val);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Sort Filter
                      Expanded(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.pink.shade100,

                          isExpanded: true,
                          value: sortBy,
                          items: [
                            "None",
                            "Budget (Low-High)",
                            "Budget (High-Low)",
                            "Capacity"
                          ]
                              .map((val) =>
                              DropdownMenuItem(value: val, child: Text(val)))
                              .toList(),
                          onChanged: (val) {
                            setState(() => sortBy = val!);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),

            // --- Caterer List ---
            Expanded(
              child: ListView.builder(
                itemCount: filteredCaterers.length,
                itemBuilder: (context, index) {
                  final caterer = filteredCaterers[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(caterer.name,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          "Budget: ₹${caterer.budget} | Capacity: ${caterer.capacity} | "
                              "${caterer.vegOnly ? "Veg Only" : "Veg & Non-Veg"}"),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent.shade200,
                            foregroundColor: Colors.white
                        ),
                        onPressed: () {
                          final budgetController = Get.find<AmountController>();
                          budgetController.selectedCaterer.value = caterer;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${caterer.name} selected as Caterer")),
                          );
                        },
                        child: const Text("Select"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
    ]
      ),
    );
  }
}
