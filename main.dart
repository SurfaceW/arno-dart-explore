import 'lib/points.dart' as points show Point, PI, addOne hide ZInitializer;
import 'lib/deferred.dart' deferred as rarelyUsed;

void main() {
  var point = new points.Point(22, 33);
  print(points.addOne(2));
  print(point.x);
  print(points.PI);
  rarelyUsed.loadLibrary().then((value) => print(rarelyUsed.CONSTANT_VAL));
}
