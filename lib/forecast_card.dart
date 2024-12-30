import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;
  const ForecastCard({super.key, required this.time, required this.icon, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container( // for decoration (Border) here we use Container else we can use padding
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child:  Column(
          children: [
            Text(time, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            const SizedBox(height: 8,),
            Icon(icon, size: 32,),
            const SizedBox(height: 8,),
            Text(temp),
          ],
        ),
      ),
    );
  }
}
