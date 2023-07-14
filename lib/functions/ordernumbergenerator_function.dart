import 'dart:math';

import '../utils/my_package.dart';

String ordernumbergenerator(List<String> existingOrderNumbers) {
  Random random = Random();
  const String chars = '0123456789ABCDE';

  bool isUnique = false;

  while (!isUnique) {
    orderNumber = '#';

    // Generate a random 4-character order number
    for (int i = 0; i < 4; i++) {
      orderNumber += chars[random.nextInt(chars.length)];
    }

    // Check if the generated order number is unique
    if (!existingOrderNumbers.contains(orderNumber)) {
      isUnique = true;
    }
  }
  return orderNumber;
}
