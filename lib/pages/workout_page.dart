import 'package:flutter/material.dart';
import 'package:gym_app/widgets/outlined_box.dart';

class WorkoutsPage extends StatelessWidget {
  final String muscleName;
  final String assetPath;

  const WorkoutsPage({
    required this.muscleName,
    required this.assetPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(muscleName, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(assetPath, width: 200, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(
              "Workouts for $muscleName",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Menggunakan OutlinedBox yang hanya menampilkan tulisan "Create Your Split"
            OutlinedBox(
              title: "Create Your Split",
            ),
          ],
        ),
      ),
    );
  }
}
