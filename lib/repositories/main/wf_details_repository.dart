import 'package:dio/dio.dart';

import 'package:bloc_ftu/repositories/main/models/wf_details.dart';

const _host = 'https://api.openweathermap.org/data/2.5/weather?';
const _lat = 'lat=50.4500336&';
const _lon = 'lon=30.5241361&';
const _units = 'units=metric&';
const _appID = 'appid=';
const _apiKey = '4dbe24134496b55a1b13855ddf7c5847';

class WFDetailsRepository {
  Future<WFDetails> getWFDetails() async {
    final response = await Dio().get('$_host$_lat$_lon$_units$_appID$_apiKey');

    final data = response.data as Map<String, dynamic>;

    final wfDetailsList = WFDetails.fromJson(data);

    return wfDetailsList;
  }
}
