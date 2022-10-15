import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobilityAssets {
  static const mobilityImagePath = 'assets/images/mobility';
  static const mobilityImageDict = {
    '상용1톤': '$mobilityImagePath/상용1톤.jfif',
    '승합차': '$mobilityImagePath/승합차.png',
    'K3': '$mobilityImagePath/k3.jfif',
    'K5': '$mobilityImagePath/k5.jfif',
    '두돈반': '$mobilityImagePath/두돈반.jpg'
  };

  static void precacheMobilityImages(BuildContext context) {
    mobilityImageDict
        .forEach((_, value) => precacheImage(AssetImage(value), context));
    precacheImage(const AssetImage('assets/images/blank.jpg'), context);
  }

  static AssetImage getMobilityImage(String type) {
    const nullImage = AssetImage('assets/images/blank.jpg');
    return mobilityImageDict.containsKey(type)
        ? AssetImage(mobilityImageDict[type]!)
        : nullImage;
  }

  static Future<String> getMobilityManual(String type) async {
    const path = 'assets/manual';
    const nullManualPath = '$path/default.md';
    const dict = {};
    final key = dict.containsKey(type) ? dict[type]! : nullManualPath;
    return await rootBundle.loadString(key);
  }
}
