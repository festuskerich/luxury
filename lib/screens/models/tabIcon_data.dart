import 'package:flutter/material.dart';
import 'package:theluxuryshoplaravelbackend/app_theme.dart';

class TabIconData {
  TabIconData({
    required this.imagePath,
    this.index = 0,
    required this.selectedImagePath,
    this.isSelected = false,
    this.animationController,
  });

  Icon imagePath;
  Icon selectedImagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: const Icon(
        Icons.home,
        color: AppTheme.nearlyDarkBlue,
        size: 30.0,
      ),
      selectedImagePath: Icon(
        Icons.home,
        size: 40.0,
        color: Colors.yellow[9000],
      ),
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: const Icon(
        Icons.favorite,
        color: AppTheme.nearlyDarkBlue,
        size: 30.0,
      ),
      selectedImagePath: Icon(
        Icons.favorite,
        size: 40.0,
        color: Colors.yellow[9000],
      ),
      index: 2,
      isSelected: false,
      animationController: null,
    ),
  ];
}
