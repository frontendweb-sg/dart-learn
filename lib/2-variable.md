# Variables

You can declare most variables without explicitly specifying their type.

```dart
var name = 'Voyager I';
/// or
String name = 'voyager I';

var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};
```

Variable store `references`.

Once you declare variable with value, you can not re-assign with different type value.

If you want to re-assign value with other type use `Object` or `dynamic` type.

<br/>

## Null safety

Dart enforces sound `null` safety.

```dart
void main(){

  int? x; /// Nullable type. Can be `null` or string.
  assert(x==null) // true

  String name   // Non-nullable type. Cannot be `null` but can be string.

  var names; // default value is null
  assert(names==null);

}
```

## Default value

Uninitialized variables that have a nullable type have an initial value of null. Even variables with `numeric` types are initially `null`, because numbers—like everything else in Dart—are `objects`.

```dart
int? lineCount;
assert(lineCount == null);
```

with `null` safety you must initialize variable.

```dart
 int x=0;
```

Lazily initialize variable.

```dart

int lineCount; // uninitialized variable

if (weLikeToCount) {
  lineCount = countLines();
} else {
  lineCount = 0;
}

print(lineCount);
```

`Top-level` and `class` variables are lazily initialized; the initialization code runs the first time the variable is used.

## Late variable

- Declaring a non-nullable variable that's initialized after its declaration.
- Lazily initializing a variable.

If you're sure that a variable is set before it's used, but Dart disagrees, you can fix the error by marking the variable as late:

```dart

late String description;

void main() {
  description = 'Feijoada!';
  print(description);
}

```

`note:` If you fail to initialize a late variable, a runtime error occurs when the variable is used.

When you mark a variable as `late` but initialize it at its declaration, then the initializer runs the first time the variable is used

```dart
// This is the program's only call to readThermometer().
late String temperature = readThermometer(); // Lazily initialized.
```

## Final and Const

If you never intend to change a variable, use final or const, either instead of var or in addition to a type. A final variable can be set only once; a const variable is a compile-time constant. (Const variables are implicitly final.)

`Note:` Instance variables can be final but not const.

```dart
final name = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';
```

Use `const` for variables that you want to be compile-time constants.

If the `const` variable is at the class level, mark it `static const`.

```dart
 void main(){
  print(Student.collegeName);
 }

 class Student{
  static const collegeName='IGNOU';
 }
```

<br />

The `const` keyword isn't just for declaring constant variables. You can also use it to create constant values

```dart
var foo = const [];
final bar = const [];
const baz = []; // Equivalent to `const []`
```

You can change the value of a `non-final`, `non-const` variable, even if it used to have a const value:

```dart

var names = ['a', 'b'];
  names.add('c');
  print(names);

  final ages = [1, 2, 3, 4];
  ages.add(5);
  print(ages);

  // this will throw an error
  const sub = ['math', 'hindi'];
  sub.add('eng');
  print(sub);

```

Although a final object cannot be modified, its fields can be changed. In comparison, a const object and its fields cannot be changed: they're immutable.
