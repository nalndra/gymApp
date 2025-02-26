import 'package:flutter/material.dart';
import 'workout_card.dart'; // Import the WorkoutCard widget

class MuscleGroupPage extends StatelessWidget {
  final List<String> muscleGroups;

  const MuscleGroupPage({Key? key, required this.muscleGroups})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Muscle Groups"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: muscleGroups.length,
              itemBuilder: (context, index) {
                return WorkoutCard(
                  muscleName: muscleGroups[index],
                  assetPath:
                      'assets/images/${muscleGroups[index].toLowerCase()}card.jpg', // Assuming images are named accordingly
                  onTap: () {
                    // Handle tap on muscle group card if needed
                  },
                );
              },
            ),
          ),
          Divider(), // Add a divider
          Text(
            'Added Split Section', // Add text for the split
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
