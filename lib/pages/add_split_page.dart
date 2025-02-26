import 'package:flutter/material.dart';
import 'muscle_group_page.dart'; // Import the new MuscleGroupPage

class AddSplitPage extends StatefulWidget {
  const AddSplitPage({super.key});

  @override
  _AddSplitPageState createState() => _AddSplitPageState();
}

class _AddSplitPageState extends State<AddSplitPage> {
  final TextEditingController _splitNameController = TextEditingController();
  final List<String> _selectedMuscles = [];
  final List<String> _addedSplits = [];

  final List<String> _muscleGroups = [
    "Chest",
    "Back",
    "Biceps",
    "Triceps",
    "Shoulders",
    "Legs",
    "Forearms",
    "Abs"
  ];

  void _toggleMuscleSelection(String muscle) {
    setState(() {
      if (_selectedMuscles.contains(muscle)) {
        _selectedMuscles.remove(muscle);
      } else {
        _selectedMuscles.add(muscle);
      }
    });
  }

  void _saveSplit() {
    if (_splitNameController.text.isEmpty || _selectedMuscles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a name and select muscles")),
      );
      return;
    }

    _addedSplits.add(
        '${_splitNameController.text} - Muscle Groups: ${_selectedMuscles.join(', ')}');

    // Navigate to the Muscle Group Page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MuscleGroupPage(muscleGroups: _selectedMuscles),
      ),
    );

    // Navigate to the Muscle Group Page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MuscleGroupPage(muscleGroups: _selectedMuscles),
      ),
    );

    setState(() {}); // Refresh the UI to show the added splits

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Add Your Split", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Split Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _splitNameController,
              decoration: const InputDecoration(
                hintText: "Enter split name (e.g., Push Day)",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Select Muscle Groups",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: _muscleGroups.map((muscle) {
                final isSelected = _selectedMuscles.contains(muscle);
                return FilterChip(
                  label: Text(muscle),
                  selected: isSelected,
                  onSelected: (_) => _toggleMuscleSelection(muscle),
                  selectedColor: Colors.black,
                  checkmarkColor: Colors.white,
                  backgroundColor: Colors.grey[300],
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            const Divider(color: Colors.black),
            const SizedBox(height: 2), // Reduced space before the splits list

            const Text(
              "Added Splits",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: _addedSplits.map((split) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(split),
                  ),
                );
              }).toList(),
            ),






            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveSplit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text(
                  "Save Split",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
