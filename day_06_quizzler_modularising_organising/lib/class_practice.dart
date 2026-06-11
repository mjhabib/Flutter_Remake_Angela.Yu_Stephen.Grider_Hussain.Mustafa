// ============================================
// =============== Classes ====================

// create a new class
class Human {
  // class properties
  double height = 150;
  // "late" means I'll provide a value later to prevent non-nullable error
  late int age;

  // create a constructor or an initializer
  Human({required this.age});
  // or -> another syntax when we have multiple lines of code:
  // Human({required int age}){
  //   this.age = age;
  // }

  // create a method
  void saySomething(String something) {
    print(something);
  }
}

// =============== Abstraction ====================
// showing only the important parts and hiding the details

// =============== Encapsulation ==================
// keeping data and code together while protecting the data from direct access

// =============== Inheritance ====================
// making a new class from an existing class so it can reuse its features

class Car {
  int numOfSeats;

  // Constructor for Car to initialize numOfSeats
  // Using named parameters with defaults for flexibility
  Car({this.numOfSeats = 5});

  void drive() {
    print("The car's wheels are rotating...");
  }
}

class ElectricCar extends Car {
  int batteryCapacity;

  // Constructor for ElectricCar
  // It takes batteryCapacity as a named parameter
  // And it calls the superclass (Car) constructor using `super()`
  ElectricCar({this.batteryCapacity = 100, super.numOfSeats});
}

// =============== Polymorphism ===================
// letting the same method or action behave differently depending on the object

class LevitatingCar extends Car {
  // a levitating car does not have a drive functionality, so we have to override it
  @override
  void drive() {
    print("The levitating car glides forward ...");
  }
}

class SelfDriveCar extends Car {
  // we can also add features to our class besides those inherited ones
  String destination;

  SelfDriveCar({required this.destination});

  @override
  void drive() {
    super.drive();
    print("The car drives by itself to $destination");
  }
}

// ============================================
// =============== Objects ====================
// ignore_for_file: avoid_print

void main() {
  // create an object (Type objName = ClassName)
  Human jenny = Human(age: 26);
  print("Default height: ${jenny.height}");
  print("Provided age: ${jenny.age}");

  // assign a new value
  jenny.height = 200;
  print("New height: ${jenny.height}");

  // call the method
  jenny.saySomething("Why is the sky blue?!");

  // inheritance examples
  Car myToyota = Car();
  ElectricCar myTesla = ElectricCar(numOfSeats: 4, batteryCapacity: 90);
  LevitatingCar myPlane = LevitatingCar();
  SelfDriveCar myNewTesla = SelfDriveCar(destination: "Najafabad city.");

  print("Normal car's default seats: ${myToyota.numOfSeats}");
  print("Electric car's custom seats: ${myTesla.numOfSeats}");
  print("Electric car's custom battery: ${myTesla.batteryCapacity}");
  myTesla.drive();
  myPlane.drive();
  myNewTesla.drive();
}
