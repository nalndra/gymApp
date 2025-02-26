import 'package:flutter/material.dart';
// Import Google Fonts

import 'package:gym_app/pages/workout_card.dart';
import 'package:gym_app/pages/workout_page.dart';
import 'package:gym_app/pages/add_split_page.dart';

class MuscleSelectionPage extends StatefulWidget {
  const MuscleSelectionPage({super.key});

  @override
  _MuscleSelectionPageState createState() => _MuscleSelectionPageState();
}

class _MuscleSelectionPageState extends State<MuscleSelectionPage> {
  bool _isScrolled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout",
            style: TextStyle(
                color: Colors.white, fontFamily: 'Kanit')), // Set font to Kanit

        centerTitle: true,
        backgroundColor: Colors.black,
        leading: null,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              _isScrolled = scrollNotification.metrics.pixels > 50;
            });
          }
          return false;
        },
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            const Text(
              "What muscle are you training today?",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit'), // Set font to Kanit
            ),
            const SizedBox(height: 10),
            _buildAddSplitCard(),
            _buildMuscleCard("Chest", "assets/images/chestcard.jpg"),
            _buildMuscleCard("Back", "assets/images/backcard.jpg"),
            _buildMuscleCard("Biceps", "assets/images/bicepcard.jpg"),
            _buildMuscleCard("Triceps", "assets/images/tricepcard.jpg"),
            _buildMuscleCard("Shoulders", "assets/images/shoulderscard.jpg"),
            _buildMuscleCard("Legs", "assets/images/legscard.jpg"),
            _buildMuscleCard("Forearms", "assets/images/forearmscard.jpg"),
            _buildMuscleCard("Abs", "assets/images/abscard.jpg"),
          ],
        ),
      ),
      floatingActionButton: _isScrolled ? _buildFloatingButton() : null,
    );
  }

  Widget _buildAddSplitCard() {
    return GestureDetector(
      onTap: () => _navigateToAddSplit(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 40, color: Colors.black),
            SizedBox(height: 8),
            Text(
              "Create Your Split",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit'), // Set font to Kanit
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk daftar card muscle
  Widget _buildMuscleCard(String muscleName, String assetPath) {
    return WorkoutCard(
      muscleName: muscleName,
      assetPath: assetPath,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                WorkoutsPage(muscleName: muscleName, assetPath: assetPath),
          ),
        );
      },
    );
  }

  // Tombol plus yang muncul di kanan bawah saat scroll (Kotak penuh)
  // FloatingActionButton TANPA double border
  Widget _buildFloatingButton() {
    return FloatingActionButton(
      onPressed: _navigateToAddSplit,
      backgroundColor: Colors.white,
      elevation: 2, // Tambahin shadow dikit biar gak nempel banget
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Kotak penuh
        side: const BorderSide(color: Colors.black, width: 2),
      ),
      child: const Icon(Icons.add, color: Colors.black, size: 30),
    );
  }

  // Navigasi ke halaman "Add Your Split"
  void _navigateToAddSplit() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AddSplitPage()),
    );
  }
}
