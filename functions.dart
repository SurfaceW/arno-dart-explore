doSomething(words, [count = 2]) {
  print('I am a function');
  print(count);
  print(fail.runtimeType);
}

addAddress({name: '', work, number, city}) {
  print(name);
  print(work);
  print(number);
  print(city);
}

fail() {
  print('failed');
}

missArgsFn(name, {ifMissing: fail}) {
  if (!name) {
    return ifMissing();
  }
}

not(a) => !a;
or(a, b) => a || b;
nor(fn) => not(or(fn(1), fn(2)));

// demo class for iterable
class NaturalsIterable {
  var n;
  NaturalsIterable.to(this.n);
  get iterator => new NaturalsIterable.to(n);
}

// demo class for iterator
class NaturalIterator {
  var n;
  var current = -1;
  NaturalIterator(this.n);
  moveNext() {
    if (current < n) {
      current++;
      return true;
    }
    return false;
  }

  naturalsTo(n) => new NaturalsIterable.to(n);
}

naturalGenerator() sync* {
  var i = 0;
  while (i <= 2) {
    yield i++;
  }
}

main(List<String> args) {
  // optional paramter
  doSomething('hello');

  // named paramter
  print(addAddress(name: 'China', work: 'Alibaba', number: 22, city: 'Citydo'));

  // Cascades
  [1, 2, 3, 4]
    ..add(3)
    ..removeLast()
    ..add(2)
    ..add(99);

  // function as first-class
  print(nor((a) => a > 2));
  print(nor is Function);

  // iterable and iterator
  // for (var i in naturalGenerator()) {
  //   print(i);
  // }

  // generator function
  var naturalIterable = naturalGenerator();
  naturalIterable.iterator.moveNext();
  print(naturalIterable.iterator.current);
}
