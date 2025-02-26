import 'package:flutter/material.dart';

class RankPage extends StatelessWidget {
  const RankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rank",
            style: TextStyle(
                color: Colors.white, fontFamily: 'Kanit')), // Set font to Kanit

        backgroundColor: Colors.black,
        leading: null, // Remove back button
      ),
      body: const Center(
        child: Text(
          "Leaderboard and Achievements",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Kanit'), // Set font to Kanit
        ),
      ),
    );
  }
}
