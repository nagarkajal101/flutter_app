/*import 'package:flutter/material.dart';

class Venue {
  final String name;
  final int total_amount; // in INR
  final int capacity;

  Venue({required this.name, required this.total_amount, required this.capacity});
}

class VenueScreen extends StatefulWidget {
  @override
  _VenueScreenState createState() => _VenueScreenState();
}

class _VenueScreenState extends State<VenueScreen> {
  List<Venue> venues = [
    Venue(name: "Grand Palace Hall", total_amount: 150000, capacity: 500),
    Venue(name: "Royal Banquet", total_amount: 80000, capacity: 300),
    Venue(name: "Sunset Garden", total_amount: 60000, capacity: 200),
    Venue(name: "City View Rooftop", total_amount: 100000, capacity: 350),
    Venue(name: "Ocean Pearl Resort", total_amount: 200000, capacity: 700),
    Venue(name: "Classic Community Hall", total_amount: 40000, capacity: 150),
  ];

  String sortBy = "None";
  int? minCapacity;
  int? maxBudget;

  List<Venue> get filteredVenues {
    List<Venue> filtered = venues;

    if (minCapacity != null) {
      filtered = filtered.where((v) => v.capacity >= minCapacity!).toList();
    }
    if (maxBudget != null) {
      filtered = filtered.where((v) => v.total_amount <= maxBudget!).toList();
    }

    if (sortBy == "Budget (Low-High)") {
      filtered.sort((a, b) => a.total_amount.compareTo(b.total_amount));
    } else if (sortBy == "Budget (High-Low)") {
      filtered.sort((a, b) => b.total_amount.compareTo(a.total_amount));
    } else if (sortBy == "Capacity") {
      filtered.sort((a, b) => b.capacity.compareTo(a.capacity));
    }

    return filtered;
  }

  void _showFilterDialog() {
    TextEditingController capacityController = TextEditingController();
    TextEditingController budgetController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Filter Venues"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: capacityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Min Capacity"),
            ),
            TextField(
              controller: budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Max Budget"),
            ),
            DropdownButton<String>(
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
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  minCapacity = capacityController.text.isNotEmpty
                      ? int.parse(capacityController.text)
                      : null;
                  maxBudget = budgetController.text.isNotEmpty
                      ? int.parse(budgetController.text)
                      : null;
                });
                Navigator.pop(context);
              },
              child: Text("Apply"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Venues"),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredVenues.length,
        itemBuilder: (context, index) {
          final venue = filteredVenues[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(venue.name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                  "Budget: ₹${venue.total_amount} | Capacity: ${venue.capacity}"),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${venue.name} selected")),
                  );
                },
                child: Text("Select"),
              ),
            ),
          );
        },
      ),
    );
  }
}

 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/amount_controller.dart';

class Venue {
  final String name;
  final int budget; // in INR
  final int capacity;

  Venue({required this.name, required this.budget, required this.capacity});
}

class VenueScreen extends StatefulWidget {
  @override
  _VenueScreenState createState() => _VenueScreenState();
}

class _VenueScreenState extends State<VenueScreen> {
  List<Venue> venues = [
    Venue(name: "Grand Palace Hall", budget: 150000, capacity: 500),
    Venue(name: "Royal Banquet", budget: 80000, capacity: 300),
    Venue(name: "Sunset Garden", budget: 60000, capacity: 200),
    Venue(name: "City View Rooftop", budget: 100000, capacity: 350),
    Venue(name: "Ocean Pearl Resort", budget: 200000, capacity: 700),
    Venue(name: "Classic Community Hall", budget: 40000, capacity: 150),
  ];

  String sortBy = "None";
  int? selectedCapacityFilter;
  int? selectedBudgetFilter;

  final List<int> capacityOptions = [100, 200, 300, 500];
  final List<int> budgetOptions = [50000, 100000, 150000, 200000];

  List<Venue> get filteredVenues {
    List<Venue> filtered = venues;

    if (selectedCapacityFilter != null) {
      filtered =
          filtered.where((v) => v.capacity >= selectedCapacityFilter!).toList();
    }
    if (selectedBudgetFilter != null) {
      filtered =
          filtered.where((v) => v.budget <= selectedBudgetFilter!).toList();
    }

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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink.shade200,

        title: Text("Venues"),
      ),
      body: Stack(
        children:[
      /// Background Image (pastel floral)
      Positioned.fill(
      child: Opacity(
      opacity: 0.25, // faint background effect
        child: Image.asset(
          "assets/images/floral_bg.png", // <-- add your floral image in assets
          fit: BoxFit.cover,
        ),
      ),
    ),
          Column(
          children: [
            // --- Dropdown Filters Row ---
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Capacity Filter
                  Expanded(
                    child: DropdownButton<int?>(
                      dropdownColor: Colors.pink.shade100,

                      isExpanded: true,
                      value: selectedCapacityFilter,
                      hint: Text("Min Capacity"),
                      items: [null, ...capacityOptions]
                          .map((cap) => DropdownMenuItem<int?>(

                        value: cap,
                        child: Text(cap == null ? "Select Capacity" : "≥ $cap"),
                      ))
                          .toList(),
                      onChanged: (val) {
                        setState(() => selectedCapacityFilter = val);
                      },
                    ),
                  ),
                  SizedBox(width: 8),

                  // Budget Filter
                  Expanded(
                    child: DropdownButton<int?>(
                      dropdownColor: Colors.pink.shade100,

                      isExpanded: true,
                      value: selectedBudgetFilter,
                      hint: Text("Max Budget"),
                      items: [null, ...budgetOptions]
                          .map((bud) => DropdownMenuItem<int?>(
                        value: bud,
                        child: Text(bud == null ? "Select Budget" : "≤ ₹$bud"),
                      ))
                          .toList(),
                      onChanged: (val) {
                        setState(() => selectedBudgetFilter = val);
                      },
                    ),
                  ),
                  SizedBox(width: 8),

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
            ),
            Divider(),

            // --- Venue List ---
            Expanded(
              child: ListView.builder(
                itemCount: filteredVenues.length,
                itemBuilder: (context, index) {
                  final venue = filteredVenues[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(venue.name,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          "Budget: ₹${venue.budget} | Capacity: ${venue.capacity}"),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent.shade200,
                          foregroundColor: Colors.white
                        ),
                        onPressed: () {
                          final budgetController = Get.find<AmountController>();
                          budgetController.selectedVenue.value = venue;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${venue.name} selected as Venue")),
                          );
                        },
                        child: Text("Select"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
