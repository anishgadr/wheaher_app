import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whether_app/data/model/wheather_data.dart';

class ExtraWeather extends StatelessWidget {
  const ExtraWeather({
    Key? key,
    required this.data,
  }) : super(key: key);

  final WheatherData data;
  @override
  Widget build(BuildContext context) {
    // var forecastList = snapshot.data!.list;

    // var humidity = forecastList![0].humidity!;
    // var wind = forecastList[0].speed!;
    // var rain = forecastList[0].clouds!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(CupertinoIcons.wind, color: Colors.white54),
            const SizedBox(height: 8),
            Text(
              data.current.windSpeed.toString() + " Km/h",
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              "Wind",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        Column(
          children: [
            const Icon(CupertinoIcons.drop, color: Colors.white54),
            const SizedBox(height: 8),
            Text(
              data.current.humidity.toString() + " %",
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              "Humidity",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        Column(
          children: [
            const Icon(CupertinoIcons.cloud_rain, color: Colors.white54),
            const SizedBox(height: 8),
            Text(
              data.current.dewPoint.toString() + " %",
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              "Dew",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )
          ],
        )
      ],
    );
  }
}
