class Car {
  String model;
  bool isAvailable;

  Car({required this.model, this.isAvailable = true});

  void rentCar() {
    isAvailable = false;
  }

  void returnCar() {
    isAvailable = true;
  }
}

class RentalCar {
  List<Car> cars = [];

  // here nzido new cars
  void addCar(String model) {
    cars.add(Car(
      model: model,
    ));
  }

  // rentcar method that searches for available cars by its model then it rents it (car.rentCar makes the isAvailabe = false)
  void rentCar(String model) {
    for (var car in cars) {
      if (car.model == model && car.isAvailable) {
        car.rentCar();
        print('${car.model} is rented successfully ^^');
        return;
      }
    }
  }

  // returncar method , t7wslna 3la rented cars by its model (automatically pusk rentzd it'll not be available)
  void returnCar(String model) {
    for (var car in cars) {
      if (car.model == model && !car.isAvailable) {
        car.returnCar();
        print(('returned ${car.model} successfully'));
        return;
      }
    }
  }

  //diplay meth to show all cars
  void displayCars() {
    for (var car in cars) {
      print('Car Model : ${car.model},\n Availability: ${car.isAvailable} ');
    }
  }
}

void main() {
  final rental = RentalCar();

  //dreams T__T
  rental.addCar('Lamborgini-Urus');
  rental.addCar('Mercedes-AMG GT63');
  rental.addCar('BMW-M5');
  rental.addCar('Audi-RS7');
  rental.addCar('Ferari sf90');

  rental.displayCars();

  rental.rentCar('BMW-M5');
  rental.rentCar('Audi-RS7');
  rental.rentCar('Ferari sf90');
  rental.returnCar('Audi-RS7');

  rental.displayCars();
}
