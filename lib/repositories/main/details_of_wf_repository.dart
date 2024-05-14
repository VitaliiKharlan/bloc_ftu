import 'package:dio/dio.dart';

import 'models/details_of_wf.dart';

const _host = 'https://api.openweathermap.org/data/2.5/weather?';
const _lat = 'lat=50.4500336&';
const _lon = 'lon=30.5241361&';
const _units = 'units=metric&';
const _appID = 'appid=';
const _apiKey = '4dbe24134496b55a1b13855ddf7c5847';

class DetailsOfWFRepository {
  Future<DetailsOfWF> getDetailsOfWF() async {
    final response = await Dio().get('$_host$_lat$_lon$_units$_appID$_apiKey');

    final data = response.data as Map<String, dynamic>;

    final detailsOfWFKyiv = DetailsOfWF.fromJson(data);
    print(detailsOfWFKyiv);
    return detailsOfWFKyiv;
  }
}
