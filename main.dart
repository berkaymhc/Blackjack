import 'dart:io';
import 'dart:math';

import 'randomGenerator.dart';

Future<void> main(List<String> args) async {
  int kasa = 1000;
  bool showKrupiyerCard = true;
  bool discount = true;
  while (kasa > -1) {
    int userTotal = 0;
    int krupiyerTotal = 0;
    int miktar = 0;
    bool oneTimeMinusTen = false;

    bool finish = false;
    RandomGenerator randomGenerator = RandomGenerator();
    userTotal =
        randomGenerator.randomGenerator() + randomGenerator.randomGenerator();
    krupiyerTotal = randomGenerator.randomGenerator();

    print('Bahis miktarınız: ');
    miktar = int.parse(stdin.readLineSync()!);

    print("player: $userTotal");

    print("krupiyer: $krupiyerTotal");

    while (userTotal < 21 && !finish) {
      print('What is your desicion ?');
      String? name = stdin.readLineSync();

      if (name == 'h') {
        userTotal = userTotal + randomGenerator.randomGenerator();
        if (userTotal == 21) {
          finish = true;
        }
        if (userTotal > 21) {
          print('Busted!');
          finish = true;
          showKrupiyerCard = true;
        }
      }
      if (name == 'd') {
        userTotal = userTotal + randomGenerator.randomGenerator();
        if (userTotal > 21) {
          print('Busted!');
          print("player: $userTotal");
        }
        miktar = miktar * 2;
        finish = true;
        showKrupiyerCard = true;
      }
      print("player:$userTotal");

      if (name == 's') {
        showKrupiyerCard = true;
        finish = true;
        print("player: $userTotal");
      }
    }

    if (finish) {
      while (krupiyerTotal < 17) {
        int rand = randomGenerator.randomGenerator();
        if (rand == 1 && krupiyerTotal < 11) {
          rand += 10;
          krupiyerTotal = krupiyerTotal + rand;
        }

        await Future.delayed(Duration(seconds: 2));
        krupiyerTotal = krupiyerTotal + rand;
        print("Krupiyer $rand çekti");
        print("Krupiyer: $krupiyerTotal");
      }

      //   print("krupiyer: $krupiyerTotal");
      print("player: $userTotal");

      if ((krupiyerTotal > userTotal && krupiyerTotal < 22) || userTotal > 21) {
        kasa = kasa - miktar;
        print("Kaybettiniz");
      } else if (krupiyerTotal == userTotal) {
        print("İade");
      } else {
        kasa = kasa + miktar;
        print("Kazandınız!");
      }
      if (kasa == 0) {
        print('Do you want discount?');
        String? answer = stdin.readLineSync();
        if (answer == "yes" && discount) {
          discount = false;
          kasa = 300;
          print("Tutar hesabınıza eklendi. Bol şans dileriz");
        }
      }
      print(kasa);
      print(
          "*********************************************************************************************************************************************");
    }
  }
}
