/*

Write a Dart function that takes a list of integers, squares all the even numbers, and sums all the odd numbers using the `map()` function.

**Example:**

- Input: `[1, 2, 3, 4, 5, 6]`
- Output: `(Sum of odd numbers: 9, Squared even numbers: [4, 16, 36])`(Explanation: The odd numbers are `1, 3, 5` whose sum is `9`. The even numbers are `2, 4, 6` whose squares are `4, 16, 36`.)

**Requirements:**

1. Write a function `processList(List<int> numbers)` that:
    - Squares the even numbers.
    - Sums the odd numbers.
2. Use `map()` to apply transformations to the list and combine them accordingly.
3. The function should return a tuple or custom object containing:
    - The sum of the odd numbers.
    - The list of squared even numbers.
*/
import 'dart:io';

void main() {
  print('Enter a lsit of integers :');
  String? input = stdin.readLineSync();

  if (input != null) {
    List<int> numbers = input.split(' ').map(int.parse).toList();
    Map<String, dynamic> results = processList(numbers);

    print('the sum of odd numbers is ${results['sum']}');
    print('Squared even numbers are ${results['evenNums']}');
  }
}

Map<String, dynamic> processList(List<int> numbers) {
  List<int> evenNums = [];
  int oddsum = 0;

  numbers.map((number) {
    if (number % 2 == 0) {
      evenNums.add(number * number);
    } else {
      oddsum += number;
    }
  }).toList();

  return {'sum': oddsum, 'evenNums': evenNums};
}
