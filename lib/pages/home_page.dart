import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gym App",
          style: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.kanit().fontFamily,
          ),
        ),
        backgroundColor: Colors.black,
        leading: null,
      ),
      body: Obx(() {
        return controller.posts.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.fitness_center, size: 100, color: Colors.grey),
                    SizedBox(height: 20),
                    Text(
                      "Welcome to Your Gym App",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Track your progress and workouts easily!",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      title: Text(controller.posts[index]['text'] ?? ""),
                      subtitle: controller.posts[index]['image']!.isNotEmpty
                          ? Image.file(File(controller.posts[index]['image']!), height: 100)
                          : null,
                      trailing: IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () => _showOptionsDialog(index),
                      ),
                    ),
                  );
                },
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPostDialog(),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  void _showPostDialog({int? index}) {
    // Implementation remains the same
  }

  void _showOptionsDialog(int index) {
    // Implementation remains the same
  }
}
