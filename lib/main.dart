import 'package:flutter/material.dart';

import 'core/utils/constants.dart';

void main() {
  runApp(const ElectronicsApp());
}

class ElectronicsApp extends StatelessWidget {
  const ElectronicsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: Constants.kPoppins),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Electronics App'),),
        body: const Text('Flutter Demo Home Page'),
      ),
    );
  }
}
