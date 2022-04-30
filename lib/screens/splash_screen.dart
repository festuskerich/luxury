import 'dart:async';

import 'package:flutter/material.dart';
import 'package:theluxuryshoplaravelbackend/app_theme.dart';
import 'package:theluxuryshoplaravelbackend/screens/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const AdvertsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppTheme.yellow,
            ),
          ),
          Center(
            child: Image.asset(
              "assets/icon/logo.png",
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
