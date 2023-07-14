import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoop3/widgets/areyousure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../functions/ordernumbergenerator_function.dart';
import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/elevatedbutton.dart';
import '../../../widgets/smalltext.dart';
import '../preorder receipt student/preorderreceiptstudent_bg.dart';
import 'preordercheckoutstudent.dart';

class MainCheckoutPage extends StatefulWidget {
  const MainCheckoutPage({super.key});

  @override
  State<MainCheckoutPage> createState() => _MainCheckoutPageState();
}

class _MainCheckoutPageState extends State<MainCheckoutPage> {
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Image.asset('assets/images/bghomepage.png',
                      fit: BoxFit.cover, width: 1620.w),
                  const MainCheckoutPageContent()
                ],
              ),
            ),
            SizedBox(
              height: 2160.h,
              width: 1620.w,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 325.h,
                  width: 1620.w,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30.r)),
                      border: Border.all(color: AppColors.c000000_25, width: 2),
                      color: AppColors.cFFFFFF_100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 920.w,
                        child: ListTile(
                          title: SmallText(
                            text: 'Total',
                            size: 48.sp,
                            color: AppColors.c000000_100,
                            fontWeight: FontWeight.w600,
                          ),
                          trailing: FutureBuilder(
                            future: getCartItems(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasData &&
                                    snapshot.data!.docs.isNotEmpty) {
                                  for (var element in snapshot.data!.docs) {
                                    final data =
                                        element.data() as Map<String, dynamic>;
                                    total = (total + data['total RM']);
                                  }

                                  return SmallText(
                                    text:
                                        'RM ${(total + processingfee).toStringAsFixed(2)}',
                                    size: 48.sp,
                                    color: AppColors.c000000_100,
                                    fontWeight: FontWeight.w600,
                                  );
                                } else {
                                  return SmallText(
                                    text: 'RM 0.00',
                                    size: 48.sp,
                                    color: AppColors.c000000_100,
                                    fontWeight: FontWeight.w600,
                                  );
                                }
                              }
                              return const CircularProgressIndicator();
                            },
                          ),
                          // SmallText(
                          //   text: 'RM 15.00',
                          //   size: 48.sp,
                          //   color: AppColors.c000000_100,
                          //   fontWeight: FontWeight.w600,
                          // ),
                        ),
                      ),
                      MyElevatedButton(
                          text: 'Pay',
                          onPressed: () {
                            areyousure(context, onPressedYes: () {
                              Navigator.pop(context);
                              setState(() {
                                orderNumber =
                                    ordernumbergenerator(existingOrderNumbers);
                              });
                              FirebaseFirestore.instance
                                  .collection('orders')
                                  .doc(orderNumber)
                                  .set({
                                'paid': false,
                                'Customer': fullname,
                                'Class': class_,
                                'OrderNumber': orderNumber,
                                'PickupTime': pickuptime,
                                'Subtotal': total,
                                'userid': userid,
                                'discount': discount,
                                'overalltotal': total + processingfee,
                                'processingfee': processingfee,
                                'cancelled': false
                              });
                              FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(userid)
                                  .collection('cart')
                                  .get()
                                  .then((QuerySnapshot querySnapshot) {
                                for (var doc in querySnapshot.docs) {
                                  final data =
                                      doc.data() as Map<String, dynamic>;
                                  FirebaseFirestore.instance
                                      .collection('orders')
                                      .doc(orderNumber)
                                      .collection('items')
                                      .doc(data['item name'])
                                      .set({
                                    'item name': data['item name'],
                                    'quantity': data['quantity'],
                                    'price': data['price'],
                                    'total': data['total RM'],
                                  });
                                }
                              });

                              FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(userid)
                                  .collection('cart')
                                  .get()
                                  .then((QuerySnapshot querySnapshot) {
                                for (var doc in querySnapshot.docs) {
                                  doc.reference.delete();
                                }
                              });

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainOrderPage()));
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                        content: SmallText(
                                          text:
                                              'Please show this receipt or give the code number shown to the counter!',
                                          size: 48.sp,
                                          color: AppColors.c000000_100,
                                          fontWeight: FontWeight.w600,
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: <CupertinoDialogAction>[
                                          CupertinoDialogAction(
                                            child: SmallText(
                                              text: 'Okay',
                                              size: 36.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.c0096FF_100,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ));
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
