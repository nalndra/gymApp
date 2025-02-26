import 'package:flutter/material.dart';

class OutlinedBox extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final Widget? child;

  const OutlinedBox({
    Key? key,
    required this.title,
    this.height,
    this.width,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60, // Default height jika tanpa child
      width: width ?? double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
