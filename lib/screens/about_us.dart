import 'package:flutter/material.dart';
import 'package:theluxuryshoplaravelbackend/app_theme.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:  const EdgeInsets.only(bottom: 10),
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
                        const CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.deepOrangeAccent,
                          child: Icon(
                            Icons.info,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'About Us',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
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
            const SizedBox(height: 5.0),
            Container(
              margin: const EdgeInsets.all(18.0),
              child: Center(
                child: Column(
                  children: const [
                    Center(
                      child: Text(
                        "The Luxury shop est une entreprise de luxe , partenaire de Vlisco, œuvrant dans la vente des pagnes et des accessoires de beauté.  Située principalement  dans les villes de Kolwezi et Lubumbashi, the Luxury  shop a pour mission de satisfaire ses clients en offrant un service rapide, fiable et de qualité supérieure.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                            height: 1.8,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 60.0),
                    Center(
                      child: Text(
                        'Informations de contact',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            letterSpacing: 2.0,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Center(
                      child: Text(
                        "Téléphoner: 0810000274",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                            height: 1.8,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(
                        "Whatsapp: 0810000274",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                            height: 1.8,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
