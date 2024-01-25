void main() {
  print(Developer.htmlDeveloper.isReactDeveloper);
  print(Color.blue.toMessage() == "Blue");
}

enum Color { red, green, blue }

extension ToCapitalize on Color {
  String toMessage() {
    switch (this) {
      case Color.red:
        return "Red";
      case Color.green:
        return "Green";
      case Color.blue:
        return "Blue";
      default:
        return 'no enum';
    }
  }
}

enum Developer {
  htmlDeveloper(name: 'Pradeep', designatioon: 'html developer', salary: 50000),
  reactDeveloper(name: 'sukanya', designatioon: 'react', salary: 10000);

  const Developer({
    required this.name,
    required this.designatioon,
    required this.salary,
  });

  final String name;
  final String designatioon;
  final double salary;

  bool get isReactDeveloper => this == Developer.htmlDeveloper;
}


// enum Vehicle  {
//   car(tires: 4, passengers: 5, carbonPerKilometer: 400),
//   bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
//   bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0),
//   truck(tires: 2, passengers: 1, carbonPerKilometer: 0)

//   const Vehicle({
//     required this.tires,
//     required this.passengers,
//     required this.carbonPerKilometer,
//   });

//   final int tires;
//   final int passengers;
//   final int carbonPerKilometer;


// }

