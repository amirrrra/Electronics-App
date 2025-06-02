import 'package:electronics_app/features/authentication/presentation/views/signup_view.dart';
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
      home: SignupView(),
    );
  }
}
