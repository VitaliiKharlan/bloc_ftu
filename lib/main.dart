import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:bloc_ftu/bloc_ftu_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();
  dio.interceptors.add;

  runApp(const BlocFirstTimeUseApp());
}
