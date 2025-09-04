import 'package:flutter/material.dart';

class BudgetSuggestionScreen extends StatefulWidget {
  const BudgetSuggestionScreen({super.key});

  @override
  State<BudgetSuggestionScreen> createState() => _BudgetSuggestionScreenState();
}

class _BudgetSuggestionScreenState extends State<BudgetSuggestionScreen> {
  final TextEditingController _budgetController = TextEditingController();
  Map<String, double> _suggestions = {};

  /// Predefined percentages for each item
  final Map<String, double> _percentages = {
    "Venue": 0.40,        // 40%
    "Catering": 0.30,     // 30%
    "Decorations": 0.15,  // 15%
    "Wedding Rings": 0.10, // 10%
    "Miscellaneous": 0.05 // 5%
  };

  void _calculateSuggestions() {
    final enteredBudget = double.tryParse(_budgetController.text);

    if (enteredBudget == null || enteredBudget <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid total_amount amount")),
      );
      return;
    }

    // Calculate based on percentages
    setState(() {
      _suggestions = _percentages.map((item, percent) =>
          MapEntry(item, enteredBudget * percent));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Suggestions"),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Stack(
        children: [
      /// Background Image
      Positioned.fill(
      child: Opacity(
      opacity: 0.15, 
        child: Image.asset(
          "assets/images/pastel_pink_flower_background.jpeg", 
          fit: BoxFit.contain,
        ),
      ),
    ),
          Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// Input field
              TextField(
                controller: _budgetController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Total Budget",
                  prefixIcon: Icon(Icons.currency_rupee),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              /// Calculate button
              ElevatedButton(
                onPressed: _calculateSuggestions,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent.shade200,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text("Get Suggestions"),
              ),
              const SizedBox(height: 20),

              /// Show suggestions
              if (_suggestions.isNotEmpty)
                Expanded(
                  child: ListView(
                    children: _suggestions.entries.map((entry) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        elevation: 4,
                        child: ListTile(
                          leading: const Icon(Icons.check_circle, color: Colors.deepPurple),
                          title: Text(entry.key,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          trailing: Text(
                            "₹ ${entry.value.toStringAsFixed(0)}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
            ],
          ),
        ),]
      ),
    );
  }
}
