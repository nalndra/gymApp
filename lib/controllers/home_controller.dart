import 'package:get/get.dart';

class HomeController extends GetxController {
  // Observable list of posts
  var posts = <Map<String, String>>[].obs;

  // Define any methods to manipulate the state
  void increment() {
    // Example method
  }

  // Add methods to manage posts if needed
  void addPost(Map<String, String> post) {
    posts.add(post);
  }

  void removePost(int index) {
    posts.removeAt(index);
  }
}
