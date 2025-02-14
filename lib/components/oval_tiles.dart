import 'package:flutter/material.dart';

class OvalTiles extends StatelessWidget {
  final void Function()? onTap;
  final String imagePath;
  const OvalTiles({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white),
        child: Image.asset(
          imagePath,
          height: 30,
        ),
      ),
    );
  }
}
