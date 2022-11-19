import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whether_app/wheather/widget/current_wheather.dart';
import 'package:intl/intl.dart';

class WheatherPage extends StatelessWidget {
  const WheatherPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030317),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: const Color(0xff556bf9),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: const [
              CurrentWeather(),
            ],
          )
        ],
      ),
    );
  }
}
