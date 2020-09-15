import 'dart:mirrors' show reflectClass, ClassMirror;
import 'lib/points.dart' as points
    show Point, APoint, PI, addOne
    hide ZInitializer;
import 'lib/deferred.dart' deferred as rarelyUsed;

void main() {
  // basic expressions
  bool aBool = true;
  int aInteger = 2;
  double aDouble = 3.12;
  String aString = '"Hello" Arno';
  Symbol aSymbol = #arno.nan.dart;

  print(
      'basic expression is ${aBool} ${aInteger} ${aDouble} ${aString} ${aSymbol}');

  // use library
  var point = new points.Point(22, 33);
  print(points.addOne(2));
  print(point.x);
  print(points.PI);

  // use deferred lib
  rarelyUsed.loadLibrary().then((value) => print(rarelyUsed.CONSTANT_VAL));

  // use assert
  assert(aBool.runtimeType == bool);

  // try - catch - on - finally statements
  try {
    aDouble += aDouble;
  } on Exception catch (e, s) {
    print(e);
    print(s);
  } finally {
    print('execute the finally {} statement');
  }

  // Reflection use introspection
  var pointMirror = reflectClass(points.Point);
  print('instaceMembers:');
  for (Symbol memberName in pointMirror.instanceMembers.keys) {
    print(memberName);
  }
  print('staticMembers:');
  for (Symbol memberName in pointMirror.staticMembers.keys) {
    print(memberName);
  }
}
