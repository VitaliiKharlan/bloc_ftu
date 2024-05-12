import 'package:flutter/material.dart';

import 'features/main/view/main_screen.dart';

class BlocFirstTimeUseApp extends StatelessWidget {
  const BlocFirstTimeUseApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc FirstTimeUse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
