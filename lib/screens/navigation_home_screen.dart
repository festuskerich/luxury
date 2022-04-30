import 'package:flutter/material.dart';
import 'package:theluxuryshoplaravelbackend/custom_drawer/drawer_user_controller.dart';
import 'package:theluxuryshoplaravelbackend/custom_drawer/home_drawer.dart';
import 'package:theluxuryshoplaravelbackend/screens/screens.dart';

import '../app_theme.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({Key? key}) : super(key: key);

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  late Widget screenView;
  late DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const MainAppHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const MainAppHomeScreen();
        });
      } else if (drawerIndex == DrawerIndex.Store) {
        setState(() {
          screenView = StoresScreen();
        });
      } else if (drawerIndex == DrawerIndex.Fav) {
        setState(() {
          screenView = const FavouritesScreen();
        });
      } else if (drawerIndex == DrawerIndex.About) {
        setState(() {
          screenView = const AboutUsScreen();
        });
      } else if (drawerIndex == DrawerIndex.Share) {
        setState(() {
          screenView = const AboutUsScreen();
        });
      } else {
        //do in your way......
      }
    }
  }
}
