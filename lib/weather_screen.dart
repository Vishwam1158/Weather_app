import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/secrets.dart';
import 'additional_info.dart';
import 'forecast_card.dart';
import 'package:http/http.dart' as http;


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future getCurrentWeather() async { // we won't call this function in build because we want to keep build simple and keep async fun away from build
    try {
      String cityName = "Surat" ;
      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey'
        ),
      );
      // if(res.statusCode == 200) or
      final data = jsonDecode(res.body);
      if(data['cod']!='200') { // or int.parse(data['cod']!=200)
        throw 'An unexpected error occurred'; //working of throw is similar to return and return from here if throw called and does not execute below code
      }
      setState(() { // first it assign temp value is zero run build and display 0 as O/P and temp value from api assign later, now setState again called build that shows updates value, but we can show loading instead of zero at first.
      temp = data['list'][0]['main']['temp']; // print it to check if it works correctly
      });
    } catch (e) {
      throw e.toString(); //throw error
    }

    // print(result.body);
  }

  double temp = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentWeather();
  }

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
      body: temp==0 ? const CircularProgressIndicator() : Padding(
        padding:  const EdgeInsets.all(16.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    child:  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          //Upper Text
                          Text("$temp K", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),),
                          //Cloud Img ?
                          const SizedBox(height: 16,),
                          const Icon(Icons.cloud, size: 64,),
                          //Bottom Text
                          const SizedBox(height: 16,),
                          const Text("Rain", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ),
            const SizedBox(height: 20,), //
            // Weather Forecast
            // const Align( //For set Text at beginning, Instead of Align also use Container
            //   alignment: Alignment.topLeft,child:
            const Text("Weather Forecast", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
            const SizedBox(height: 16,),
             const SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                children: [
                  ForecastCard(text1: "00:00", icon: Icons.cloud, text2: "301.11 "),
                  ForecastCard(text1: "03:00", icon: Icons.sunny, text2: "301.17"),
                  ForecastCard(text1: "06:00", icon: Icons.sunny, text2: "301.81"),
                  ForecastCard(text1: "09:00", icon: Icons.cloud, text2: "302"),
                  ForecastCard(text1: "12:00", icon: Icons.cloud, text2: "304"),
                ],
               ),
             ),
            const SizedBox(height: 20,),
            //Additional info
            const Text("Additional information", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
            const SizedBox(height: 16,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfo(icon: Icons.water_drop, text1: "Humidity", text2: "91"),
                AdditionalInfo(icon: Icons.air, text1: "Wind Speed", text2: "7.5"),
                AdditionalInfo(icon: Icons.beach_access, text1: "Pressure", text2: "1000"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

