import 'package:whether_app/api/network_controller.dart';
import 'package:whether_app/data/model/wheather_data.dart';

class WheatherRepository{
  NetworkController _apiProvider = NetworkController();

  Future<WheatherData> getWheatherData(){
    return _apiProvider.getStocks();
  }
}