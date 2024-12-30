
import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;
  const AdditionalInfo({super.key, required this.icon, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Icon(icon, size: 32,),
        const SizedBox(height: 8,),
        Text(text1, style: TextStyle(fontSize: 16),),
        const SizedBox(height: 8,),
        Text(text2, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
      ],
    );
  }
}

