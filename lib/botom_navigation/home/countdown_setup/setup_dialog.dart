// wedding_setup_dialog.dart
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WeddingSetupDialog extends StatefulWidget {
  const WeddingSetupDialog({super.key});

  @override
  State<WeddingSetupDialog> createState() => _WeddingSetupDialogState();
}

class _WeddingSetupDialogState extends State<WeddingSetupDialog> {
  final _brideController = TextEditingController();
  final _groomController = TextEditingController();
  DateTime? _weddingDate;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );

    if (picked != null) {
      setState(() {
        _weddingDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text("Setup Wedding Countdown"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _brideController,
              decoration: const InputDecoration(
                labelText: "Bride's Name",
                prefixIcon: Icon(Iconsax.user),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _groomController,
              decoration: const InputDecoration(
                labelText: "Groom's Name",
                prefixIcon: Icon(Iconsax.user_octagon),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              readOnly: true,
              onTap: _pickDate,
              decoration: InputDecoration(
                labelText: _weddingDate == null
                    ? "Select Wedding Date"
                    : "${_weddingDate!.day}-${_weddingDate!.month}-${_weddingDate!.year}",
                prefixIcon: const Icon(Iconsax.calendar),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // cancel
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade300,foregroundColor: Colors.white),
          onPressed: () {
            if (_brideController.text.isEmpty ||
                _groomController.text.isEmpty ||
                _weddingDate == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please fill all fields")),
              );
              return;
            }
            Navigator.pop(context, {
              "bride": _brideController.text,
              "groom": _groomController.text,
              "date": _weddingDate!,
            });
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
