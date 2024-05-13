import 'package:bloc_ftu/repositories/main/wf_details_repository.dart';
import 'package:flutter/material.dart';


import 'package:bloc_ftu/bloc_ftu_app.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerLazySingleton(() => WFDetailsRepository());


  runApp(const BlocFirstTimeUseApp());
}
