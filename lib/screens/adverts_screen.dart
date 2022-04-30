import 'package:flutter/material.dart';
import 'package:theluxuryshoplaravelbackend/app_theme.dart';
import 'package:theluxuryshoplaravelbackend/screens/advert_list.dart';
import 'package:theluxuryshoplaravelbackend/screens/models/advert.dart';

class AdvertsScreen extends StatefulWidget {
  const AdvertsScreen({Key? key}) : super(key: key);

  @override
  State<AdvertsScreen> createState() => _AdvertsScreenState();
}

class _AdvertsScreenState extends State<AdvertsScreen> {
  List<Adverts>? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Luxury Shop"),
        titleTextStyle: const TextStyle(
          letterSpacing: 2.0,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[9000],
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.yellow[9000],
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)),
              boxShadow: [
                BoxShadow(
                    color: AppTheme.yellow.withOpacity(0.9),
                    offset: const Offset(1.1, 1.1),
                    blurRadius: 90.0),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 15.0),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 15.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "Adverts",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                letterSpacing: 2.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          const Flexible(
            child: AdvertList(),
          ),
        ],
      ),
    );
  }
}
