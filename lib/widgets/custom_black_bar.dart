import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts


class CustomBlackBar extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomBlackBar({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape:
              const RoundedRectangleBorder(), 
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.kanit().fontFamily, // Set font to Kanit
          ),

        ),
      ),
    );
  }
}
