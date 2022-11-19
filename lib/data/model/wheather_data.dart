import 'dart:convert';

import 'package:whether_app/data/model/current.dart';

WheatherData wheatherDataFromJson(String str) => WheatherData.fromJson(json.decode(str));

String wheatherDataToJson(WheatherData data) => json.encode(data.toJson());

class WheatherData {
    WheatherData({
        required this.lat,
        required this.lon,
        required this.timezone,
        required this.timezoneOffset,
        required this.current,
    });

    double lat;
    double lon;
    String timezone;
    int timezoneOffset;
    Current current;

    factory WheatherData.fromJson(Map<String, dynamic> json) => WheatherData(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current.toJson(),
    };
}