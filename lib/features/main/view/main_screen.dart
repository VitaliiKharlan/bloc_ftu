import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   textTheme: const TextTheme(
      //     bodyText2: TextStyle(fontSize: 33),
      //     subtitle1: TextStyle(fontSize: 22),
      //   ),
      // ),
      home: Scaffold(
        body: SafeArea(
          child: WeatherForecast(),
        ),
      ),
    );
  }
}

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
