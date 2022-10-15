// https://stackoverflow.com/questions/54138750/total-distance-calculation-from-latlng-list

import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Distance {
  const Distance._withValue(this.value);
  factory Distance.zero() => const Distance._withValue(0.0);

  factory Distance.twoPoints(LatLng p1, LatLng p2) {
    const p = 0.017453292519943295;
    const c = cos;

    final lat1 = p1.latitude;
    final lat2 = p2.latitude;
    final lon1 = p1.longitude;
    final lon2 = p2.longitude;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return Distance._withValue(12742 * asin(sqrt(a)));
  }

  factory Distance.points(List<LatLng> list) {
    if (list.length < 2) {
      return Distance.zero();
    }
    var total = 0.0;
    var lastElem = list[0];
    for (var element in list) {
      total += Distance.twoPoints(element, lastElem).value;
      lastElem = element;
    }
    return Distance._withValue(total);
  }

  final double value;
}
