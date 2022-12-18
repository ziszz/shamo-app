import 'package:flutter/material.dart';

class CenterProgressBar extends StatelessWidget {
  const CenterProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
