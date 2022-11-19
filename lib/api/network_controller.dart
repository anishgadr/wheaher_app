import 'package:dio/dio.dart';
import 'package:whether_app/api/config.dart';
import 'package:whether_app/data/model/wheather_data.dart';

class NetworkController {
  Dio dio = Dio();

  Future<WheatherData> getStocks() async {
    Response wheatherData = await dio.get(
        '$baseAppUrl/data/2.5/onecall?lat=12.9082847623315&lon=77.65197822993314&units=imperial&appid=b143bb707b2ee117e62649b358207d3e');
    WheatherData wheather = WheatherData.fromJson(wheatherData.data);
    return wheather;
  }
}
