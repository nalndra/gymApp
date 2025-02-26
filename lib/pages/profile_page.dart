import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Import the Lottie package

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_app/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  final String username; // Add a field for the username

  const ProfilePage({super.key, required this.username}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set AppBar color to black
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white), // Change title color to white
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align items to the start
          children: [
            const SizedBox(height: 20), // Add some space at the top
            Lottie.asset(
              'assets/lotties/profileImage.json', // Path to the Lottie animation

              width: 250, // Set the desired width
              height: 250, // Set the desired height
              fit: BoxFit.cover, // Cover the space
            ),
            const SizedBox(height: 20),
            Text(
                "Username: $username"), // Update to display the username with label

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
