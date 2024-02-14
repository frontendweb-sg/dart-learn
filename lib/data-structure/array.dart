///
/// Array data structure.
/// It is collection of items. (items could be of any types).
///
void main() {
  List<String> names = ['dilip', 'pradeep', 'arun', 'sanjeev']; // string list
  List<int> nums = [1, 2, 3, 4, 5, 6]; // nums list
  List<dynamic> values = [
    'pradeep',
    1,
    true,
    {'name': 'pradeep'},
    (name: 'pk')
  ]; // multi types list

  print(names.length); // print names  length
  print(names.first); // print first
  print(names.last); // print last value
  names.add('sukanya'); // add item
  // names.remove('arun'); // remove item
  print(names); // print list
  print(nums.takeWhile((value) {
    print(value);
    return value < 4;
  }));
  names.addAll(['a', 'b']);
  print(names);

  // print(names.take(2));
}
