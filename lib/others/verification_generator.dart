import 'dart:math';

String generateRandomNumber() {
  Random random = Random();
  int randomNumber = 100000 + random.nextInt(900000);
  return randomNumber.toString();
}
