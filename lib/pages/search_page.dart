import 'package:flutter/material.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search", style: TextStyle(color: Colors.white, fontFamily: 'Kanit')),


        backgroundColor: Colors.black,
        leading: null,
      ),

      body: const Center(
        child: Text(
          "Search for workouts, trainers, and more!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Kanit'),


        ),
      ),
    );
  }
}
