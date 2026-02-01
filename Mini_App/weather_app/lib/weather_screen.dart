import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // double tem = 0;
  // bool isLoading = false; //For Loading Operation->1.
  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentWeather();
  // }

  // Future getCurrentWeather() async {
  //   try {
  //     String cityName = 'London';
  //     final res = await http.get(
  //       Uri.parse(
  //         //'http://api.weatherapi.com/v1/forecast.json?key=$openWeatherAPIKey&q=$cityName&aqi=no',
  //         'http://api.weatherapi.com/v1/forecast.json?key=$openWeatherAPIKey&q=$cityName&days=1&aqi=no&alerts=no',
  //       ),
  //     );
  //     final data = jsonDecode(res.body);
  //     if (data['res.statusCode'] != '200') {
  //       throw 'An unexpected error occured';
  //     }

  //     print(data['current']['temp_c']);
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      // setState(() {
      //   isLoading = true; //For Loading Operation->2.
      // });

      String cityName = 'Jodhpur';
      final res = await http.get(
        Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=$openWeatherAPIKey&q=$cityName&days=1&aqi=no&alerts=no',
        ),
      );

      final data = jsonDecode(res.body);

      if (res.statusCode != 200) {
        throw 'An unexpected error occurred';
      }
      return data;
      // setState(() {
      //   tem = data['current']['temp_c'];
      //   isLoading = false;//For Loading Operation->3.
      // });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body:
      // isLoading
      // ? const LinearProgressIndicator():
      FutureBuilder(
        //Help in creating loading and handling error.
        future:
            getCurrentWeather(), //Give anything to it which perform in future.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            ); //Laoding Indicator=======================================|
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          //Data Gathering From Internet and Update on Device----------------------------|
          //Temperature
          final data = snapshot.data!;
          final currentAll = data["current"];
          final currentTemp = currentAll["temp_c"];
          final currentSky = currentAll["condition"]["text"];
          final currentIcon = currentAll["condition"]["icon"];
          //Humidity
          final humidity = currentAll['humidity'];
          final windspeedKph = currentAll['wind_kph'];
          final pressureMb = currentAll['pressure_mb'];

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Main Card-------------------------------------------1|.
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    " $currentTemp C",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  // Cloud Icon
                                  Image.network(
                                    "https:$currentIcon",
                                    width: 80,
                                    height: 80,
                                  ),

                                  //Sub-text
                                  const SizedBox(height: 10),
                                  Text(
                                    currentSky,
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Size Between----------------------1.5|.
                const SizedBox(height: 20),
                Text(
                  "Hourly Weather Forecast",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                //Weather Forcast Card------------------------------------------|START|.
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        // FIRST CART-----------------------|
                        HourlyForecastItem(
                          matrixtime:
                              data["forecast"]["forecastday"][0]['hour'][17 +
                                      i]['time']
                                  .toString()
                                  .split(" ")[1],
                          matrixtext:
                              data["forecast"]["forecastday"][0]['hour'][17 +
                                      i]['temp_c']
                                  .toString(),
                          matrixicon:
                              data["forecast"]["forecastday"][0]['hour'][17 +
                                      i]['condition']['icon']
                                  .toString(),
                        ),
                    ],
                  ),
                ),

                //-------------------------------------------------|END Weather Forecast|

                //Additional Information-------------------------------------------------|START|

                //Size Between----------------------2.5|.
                const SizedBox(height: 20),
                Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                //Additional Information-------------------------------------------3|.
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Additional_Info_Item(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: humidity,
                    ),
                    Additional_Info_Item(
                      icon: Icons.air,
                      label: "Wind Speed",
                      value: windspeedKph,
                    ),
                    Additional_Info_Item(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: pressureMb,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
