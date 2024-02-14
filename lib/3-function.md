# Main function

Every app has top level `main` function. which serve the entrypoint to the application.
It return `void` and has optional `List<String>` parameter for arguments.

Function default type is `dynamic`.

```dart
void main(){
    print("Hello World!");
}

/// accept command line arguments
void main(List<String> args){
    print(args); // output should be in list
    print(args.length) // lenght of the arguments
}

/// you can use [args library] to define and parse command-line arguments.
```

[args](https://pub.dev/packages/args) - arguments library

## Functions as first-class object.

You can pass a function as a parameter to another function.

```dart
void main() {
  var username = getName('Pradeep Kumar'); // passing function as expresion to a variable
  print(username);

  /// [Function] passing as value
  const nameLength = strLen(getName('arun')); /// error , method can't be invoked in constant expression

  /// here is the fix, use [type], [var] and [final]
  var nameLengthFix = strLen(getName('arun'));
  print(nameLength);
}

String getName(String name) {
  return name;
}

int strLen(String str) {
  return str.length;
}
```

`Note:` Methods can't be invoked in `constant` expressions.

## Anonymous function

You can also create `nameless` function called anonymous function or sometimes a lambda or closure.

```dart
void main() {
  var getName = (String name) {
    return name;
  }; // anonymous function assigned to getName variable
  print(getName('Pradeep')); // Pradeep
}
```

## IIFE (Immediately invoked function)

```dart

  (() {
    print('hi, i am iife');
  })();

  /// or

  ((){
    print('Hi, i am also anonymous function!')
  }).call();

```

## Lexical scope

Dart is a lexical scoped language, which means that scope of variable is determined statically.

```dart

bool topLevel = true;

void main() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}
```

## Lexical closures

A closure is a function that has access to variable in its lexical scope, even when the function
is used outside of its original scope.

```dart

void main(){

}

```

## Return value

All function return a value. If no return value is specified, the statement return null;

```dart
void main(){
    assert(foo() == null);// output will be true
}

abc(){}

/// To return multiple values in a function, aggregate the values in a record.
(String, int) multipleValues(String s, int i){
    return (s,i);
}
```

## Generators

When you need to lazily produce a sequence of values, consider using `generator` function.
Dart has built-in support for two kinds of generator functions:

1. `Synchronous generator`: Returns an `Iterable` object.
2. `Asynchronous generator`: Returns a Stream object.

**`Synchronous generator`**:

```dart

void main(){
    for(final num in fac()){
        if(num>30){
            break;
        }
        print(num);
    }
}

fab() sync*{
  var a=0,b=1;
  while(true){
    yield a;
    var c = a+b;
    a=b;
    b=c;
  }
}

```

**`Asyncronous generator`**

```dart

void main() async {
  final v = await fab();
  v.take(10).listen((event) {
    print(event);
  });
}

Stream fab() async* {
  var a = 0, b = 1;
  while (true) {
    yield a;
    var c = a + b;
    a = b;
    b = c;
  }
}

```

## External function

An external function is a function whose body implemented sepratly from its declaration.
include the `external` keyword before a function declaration.

```dart

void main(){}

external int fab(int num);

```

An external function's implementation can come from another Dart library, or, more commonly, from another language.

## How function execute.

Goes through the code `line` by `line` and runs/executes each line known as `thread` of `execution`
