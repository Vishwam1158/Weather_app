import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container( // for decoration (Border) here we use Container else we can use padding
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: const Column(
          children: [
            Text("09:00", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Icon(Icons.cloud, size: 32,),
            SizedBox(height: 8,),
            Text("301.17˚"),
          ],
        ),
      ),
    );
  }
}
