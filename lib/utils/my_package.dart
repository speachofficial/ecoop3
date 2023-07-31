library my_package.globals;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

DateTime now = DateTime.now();
DateTime pickuptime = DateTime(now.year, now.month, now.day + 1, 22, 0);
DateTime today = DateTime(now.month, now.day);

DateTime maxDate = now.add(const Duration(days: 6));
DateTime minDate = now.add(const Duration(days: 1));
DateTime minTime = DateTime(now.year, now.month, now.day, 8, 0);
DateTime maxTime = DateTime(now.year, now.month, now.day, 23, 30);

DateTime initialTime = now.isBefore(minTime) ? minTime : minDate;

String paymentmethod = 'Cash';

int processingfee = 1;
int discount = 0;

var userid = FirebaseAuth.instance.currentUser?.uid;

late String fullname;
late String class_;
late String icnumber;
late String email;
late String password;
late String role;
late String phonenumber;

late String signInUsername;
late String signInPassword;

late String productDescription;
late String productName;
late double setPrice;

late String editproductDescription;
late String editproductName;
late double editsetPrice;

late String orderNumber;

late String resetemail1;
late String resetemail2;

List<String> existingOrderNumbers = [];

List items = [];

Stream<QuerySnapshot> getAvailableProducts() {
  return FirebaseFirestore.instance
      .collection('preorder_products')
      .where('instock', isEqualTo: true)
      .snapshots();
}

Stream<QuerySnapshot> getNotAvailableProducts() {
  return FirebaseFirestore.instance
      .collection('preorder_products')
      .where('instock', isEqualTo: false)
      .snapshots();
}

Stream<QuerySnapshot> getPromotionNotice() {
  return FirebaseFirestore.instance.collection('promotion_notice').snapshots();
}

Future<QuerySnapshot> getCartItems() {
  return FirebaseFirestore.instance
      .collection('Users')
      .doc(userid)
      .collection('cart')
      .get();
}

Stream<QuerySnapshot> getAllOrdersButCancelled() {
  return FirebaseFirestore.instance
      .collection('orders')
      .where('cancelled', isEqualTo: false)
      .snapshots();
}

Stream<QuerySnapshot> getstudentsorder() {
  return FirebaseFirestore.instance
      .collection('orders')
      .where('paid', isEqualTo: false)
      .where('cancelled', isEqualTo: false)
      // .where('PickupTime', isGreaterThanOrEqualTo: now)
      .snapshots();
}

Stream<QuerySnapshot> getstudentsorderitem() {
  return FirebaseFirestore.instance
      .collection('orders')
      .doc()
      .collection('items')
      .snapshots();
}

Future deletepreorderitem(String doc, String url) async {
  try {
    await FirebaseFirestore.instance
        .collection('preorder_products')
        .doc(doc)
        .delete();
    await FirebaseStorage.instance.refFromURL(url).delete();
  } catch (e) {
    return false;
  }
}
