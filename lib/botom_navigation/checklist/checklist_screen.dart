import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  final List<Map<String, dynamic>> _checklist = [
    {"task": "Book Venue", "done": false},
    {"task": "Arrange Catering", "done": false},
    {"task": "Organize Mehndi", "done": false},
    {"task": "Hire Photographer", "done": false},
    {"task": "Plan Sangeet", "done": false},
    {"task": "Arrange Music", "done": false},
  ];

  /// Add New Task
  void _addNewTask() {
    TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Task"),
        content: TextField(
          controller: taskController,
          decoration: const InputDecoration(
            hintText: "Enter task name",
            prefixIcon: Icon(Iconsax.task),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent.shade200,
                foregroundColor: Colors.white
            ),
            onPressed: () {
              if (taskController.text.isNotEmpty) {
                setState(() {
                  _checklist.add({"task": taskController.text, "done": false});
                });
                Navigator.pop(context);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  /// Edit Task
  void _editTask(int index) {
    TextEditingController editController =
    TextEditingController(text: _checklist[index]["task"]);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Task"),
        content: TextField(
          controller: editController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.edit),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent.shade200,
              foregroundColor: Colors.white
            ),
            onPressed: () {
              setState(() {
                _checklist[index]["task"] = editController.text;
              });
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  /// Delete Task
  void _deleteTask(int index) {
    setState(() {
      _checklist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final int total = _checklist.length;
    final int completed = _checklist.where((task) => task["done"]).length;
    final double progress = total > 0 ? completed / total : 0;

    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 50,
        title: const Text("Wedding Checklist"),
        backgroundColor: Colors.pink.shade200,
        automaticallyImplyLeading: false,

      ),
      body: Stack(
        children: [
      /// Background Image (pastel floral)
      Positioned.fill(
      child: Opacity(
      opacity: 0.25, // faint background effect
        child: Image.asset(
          "assets/images/floral_bg.png", 
          fit: BoxFit.cover,
        ),
      ),
    ),
          Column(
          children: [
            /// Progress Indicator
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$completed of $total tasks completed",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.pink,
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),

            /// Checklist List
            Expanded(
              child: SlidableAutoCloseBehavior( 
                // ensure only one stays open
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _checklist.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      key: ValueKey(index),
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) => _editTask(index),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            icon: Iconsax.edit,
                            label: 'Edit',
                          ),
                          SlidableAction(
                            onPressed: (context) => _deleteTask(index),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Iconsax.trash,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CheckboxListTile(
                          title: Text(_checklist[index]["task"]),
                          value: _checklist[index]["done"],
                          activeColor: Colors.pink,
                          onChanged: (value) {
                            setState(() {
                              _checklist[index]["done"] = value!;
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ]
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.pink.withOpacity(0.7),
        onPressed: _addNewTask,
        child: const Icon(Iconsax.add),
      ),
    );
  }
}
