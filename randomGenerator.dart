import 'dart:math';

class RandomGenerator {
  int randomGenerator() {
    int i = Random().nextInt(13);
    i++;
    if (i > 10 && i < 14) {
      i = 10;
    }

    return i;
  }
}
