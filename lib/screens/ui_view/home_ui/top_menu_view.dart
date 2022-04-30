import 'package:flutter/material.dart';
import 'package:theluxuryshoplaravelbackend/app_theme.dart';
import 'package:theluxuryshoplaravelbackend/screens/screens.dart';
import 'package:url_launcher/url_launcher.dart';


class TopMenuView extends StatelessWidget {
  final AnimationController animationController;
  final Animation<double> animation;

  const TopMenuView(
      {Key? key, required this.animationController, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Column(
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'Welcome',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26.0,
                                letterSpacing: 1.5,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AboutUsScreen()),
                                      );
                                    },
                                    child: const CircleAvatar(
                                      radius: 23.0,
                                      backgroundColor: Colors.deepOrangeAccent,
                                      child: Icon(
                                        Icons.info,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  const Text(
                                    "About",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      if (await canLaunch('tel:0810000274')) {
                                        await launch('tel:0810000274');
                                      } else {
                                        throw 'Could not launch Dialer';
                                      }
                                    },
                                    child: const CircleAvatar(
                                      radius: 23.0,
                                      backgroundColor: Colors.blue,
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  const Text(
                                    "Call",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await launch(
                                          "https://wa.me/243810000274}?text=Hello, I would like to inquire about ...  ");
                                    },
                                    child: CircleAvatar(
                                        radius: 22.0,
                                        backgroundColor: Colors.purple,
                                        child: Image.asset(
                                            "assets/images/whatsap.png")),
                                  ),
                                  const SizedBox(height: 8.0),
                                  const Text(
                                    "Whatsapp",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StoresScreen()),
                                      );
                                    },
                                    child: const CircleAvatar(
                                      radius: 23.0,
                                      backgroundColor: Colors.orange,
                                      child: Icon(
                                        Icons.store,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  const Text(
                                    "Stores",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                const Center(
                  child: Text(
                    'Our Available Materials',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      letterSpacing: 1.2,
                      color: AppTheme.nearlyBlack,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
