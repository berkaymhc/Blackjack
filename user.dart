import 'dart:io';
import 'dart:math';

import 'randomGenerator.dart';

void main(List<String> args) {
  int total = 0;
  RandomGenerator randomGenerator = RandomGenerator();
  int randomNumber = randomGenerator.randomGenerator();
  total = randomNumber + randomNumber;

  print(total);
  while (total < 21) {
    print('What is your desicion ?');
    String? name = stdin.readLineSync();
    print('as $name Berkay');

    if (name == 'hit') {
      total = total + randomNumber;
      if (total > 21) {
        print('Busted!');
      }
      print(total);
    }
  }
}
