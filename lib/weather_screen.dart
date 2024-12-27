import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body:  Padding(
        padding:  EdgeInsets.all(16.0),
        child:  Column(
          children: [
            //Main Card
            SizedBox(
              width: double.infinity, // For MaxWidth, that's why wrap with Size box, if want to add color or something use Container
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder( //No need bcz below we use ClipRRect
                  borderRadius: BorderRadius.circular(16)
                ),
                child: ClipRRect( // for add Border Radius
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter( // For merging card with It's background
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), //this effect remove elevation of card, so we have to add Border Radius via ClipRRect
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          //Upper Text
                          Text("300.67˚F", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),),
                          //Cloud Img ?
                          SizedBox(height: 16,),
                          Icon(Icons.cloud, size: 64,),
                          //Bottom Text
                          SizedBox(height: 16,),
                          Text("Rain", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ),
            const SizedBox(height: 20,), //
            // Weather Forecast
            //Additional info
          ],
        ),
      ),
    );
  }
}
