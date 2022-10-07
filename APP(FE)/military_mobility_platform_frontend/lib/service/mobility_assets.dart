import 'package:flutter/material.dart';

class MobilityAssets {
  static AssetImage getMobilityImage(String type) {
    const path = 'assets/images/mobility';
    const nullImage = AssetImage('assets/images/blank.jpg');
    const dict = {
      '상용1톤': '$path/상용1톤.jfif',
      '승합차': '$path/승합차.png',
      'K3': '$path/k3.jfif',
      'K5': '$path/k5.jfif'
    };

    return dict.containsKey(type) ? AssetImage(dict[type]!) : nullImage;
  }
}
