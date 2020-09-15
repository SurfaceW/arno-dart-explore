/**
 * code seg. from The Dart Programming Language
 */
library points;

import 'dart:math';

import 'dart:svg';

export 'extra.dart';

part './constants.dart';

final List<Point> pointList = [];

// work for interface
abstract class APoint {
  var x;
  var y;
}

class Point implements APoint {
  var x, y;
  final z = 1;
  int get xPlus1 => x + 1;
  void set xPlus1(int y) {
    x = y + 1;
  }

  Point(this.x, this.y);
  Point scale(factor) => new Point(x * factor, y * factor);

  // refine the operator
  Point operator +(p) => new Point(x + p.x, y + p.y);
  bool operator ==(p) => p.x == x && p.y == y;

  static var PI = 3.141592653;
  static distance(p1, p2) {
    var dx = p1.x - p2.x;
    var dy = p1.y - p2.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class Point3D extends Point {
  var z;
  // use super()
  // execute sequence:
  // Point3D initializer => Point initializer => Object initializer
  // => Object constructor => Point constrcutor => Point3D constrcutor
  Point3D(a, b, c) : super(a, b) {
    // type reification
    if (!(c is int)) {
      throw 'Type Error, third parameter should be a int type';
    }
    // type cast
    z = c as int;
  }

  @override
  noSuchMethod(Invocation invocation) {
    // you can inject factory method here

    return super.noSuchMethod(invocation);
  }
}

class ZInitializer {
  var z;
  void fetch() {
    z = 4;
  }
}

class PointPolar with ZInitializer {
  final x, y;
  PointPolar.polar(this.x, this.y);
  // redirecting constrcutor
  PointPolar(a, b) : this.polar(a + 1, b + 1);
}

class ConstantPoint {
  final x, y;
  // constant constructor only accept constant params
  // constant constructor can not have body
  const ConstantPoint(this.x, this.y);
  // external means the method is implmented from elsewhere outside
  external maxCompute();
}

const CONSTANT_POINT = const ConstantPoint(1, 2);
