import 'dart:math' as math;
import 'package:flutter/animation.dart';

int visibleCountForWidth(double w) {
  if (w >= 900) {
    return 9;
  }
  if (w >= 650) {
    return 7;
  }
  return 5;
}

double lerpDouble(double a, double b, double t) => a + (b - a) * t;

double degToRad(double deg) => deg * math.pi / 180;

/// Pinterest-like overshoot/settle curve
class OvershootCurve extends Curve {
  final double overshoot;
  const OvershootCurve({this.overshoot = 1.12});

  @override
  double transform(double t) {
    final double tMinusOne = t - 1;
    return tMinusOne * tMinusOne * ((overshoot + 1) * tMinusOne + overshoot) +
        1;
  }
}

int orbitIndex(int current, int offset, int length) =>
    (current + offset + length) % length;
