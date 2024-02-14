///
/// Every app has top level function, which serve the entrypoint to the application
/// It return [void] and has optional [List<String>] parameter for arguments.
///
/// Function default type is [dynamic], and default return value is [null]
///
/// Methods can't be invoked in [constant] expressions.
///
void main() {
  print(getValues('Hello', 10));
}

(String, int) getValues(String s, int n) {
  return (s, n);
}
