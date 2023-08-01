import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../../utils/colors.dart';
import '../../../../utils/my_package.dart';
import '../../../../widgets/arrowback.dart';
import '../../../../widgets/bigtext.dart';
import '../../../../widgets/done.dart';
import '../../../../widgets/smalltext.dart';

class MainAddProductPageContent extends StatefulWidget {
  const MainAddProductPageContent({super.key});

  @override
  State<MainAddProductPageContent> createState() =>
      _MainAddProductPageContentState();
}

class _MainAddProductPageContentState extends State<MainAddProductPageContent> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  Future<void> uploadtofirebaseadmin() async {
    final file = File(image!.path);
    TaskSnapshot snapshot = await FirebaseStorage.instance
        .ref()
        .child("preorder_product_image/$productName")
        .putFile(file);

    final String downloadUrl = await snapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection("preorder_products")
        .doc(productName)
        .set({
      "url": downloadUrl,
      "name": productName,
      "description": productDescription,
      "RM": setPrice,
      'instock': true
    });
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  Future<void> uploadtofirebaseparent() async {
    final file = File(image!.path);
    TaskSnapshot snapshot = await FirebaseStorage.instance
        .ref()
        .child("bidding_product_image/$productName")
        .putFile(file);
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection("bidding_products")
        .doc(productName)
        .set({
      "url": downloadUrl,
      "name": productName,
      "description": productDescription,
      "RM": setPrice,
      'instock': true,
    });
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  // ElevatedButton(
                  //   //if user click this button. user can upload image from camera
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //     getImage(ImageSource.camera);
                  //   },
                  //   child: const Row(
                  //     children: [
                  //       Icon(Icons.camera),
                  //       Text('From Camera'),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final addproductkey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.only(top: 32.h, left: 118.w, right: 118.w),
      child: Form(
        key: addproductkey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            const MyBackButton(),
            Align(
                alignment: Alignment.center,
                child: BigText(
                  text: 'Add Product',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                ))
          ]),
          SizedBox(
            height: 96.h,
          ),
          image != null
              ? GestureDetector(
                  onTap: () {
                    myAlert();
                  },
                  child: SizedBox(
                    height: 500.h,
                    width: 500.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: kIsWeb
                          ? Image.network(
                              image!.path,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(image!.path),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    myAlert();
                  },
                  child: Container(
                    height: 500.h,
                    width: 500.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: DottedBorder(
                      color: AppColors.cC8151D_100,
                      strokeWidth: 5.h,
                      radius: Radius.circular(30.r),
                      dashPattern: const [15, 10],
                      child: Center(
                        child: SmallText(
                          text: '+ Add Photo',
                          size: 48.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.cC8151D_100,
                        ),
                      ),
                    ),
                  ),
                ),
          SizedBox(
            height: 138.h,
          ),
          ListTile(
            title: SmallText(
              text: 'Product Name*',
              size: 57.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.c333333_100,
            ),
            subtitle: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                } else if (!RegExp(r'^[A-Za-z ]{1,20}$').hasMatch(value)) {
                  return 'Product name cannot contain symbol or number';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                productName = value;
              },
              style: GoogleFonts.inter(
                  fontSize: 57.sp,
                  color: AppColors.cC8151D_100,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  errorStyle: GoogleFonts.inter(fontSize: 36.sp),
                  hintText: 'Product Name',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 57.sp,
                      color: AppColors.c333333_30,
                      fontWeight: FontWeight.w500),
                  border: InputBorder.none),
            ),
            // trailing: SmallText(
            //   text: '0/100',
            //   size: 57.sp,
            //   color: AppColors.c333333_30,
            //   fontWeight: FontWeight.w500,
            // ),
          ),
          SizedBox(
            height: 95.h,
          ),
          ListTile(
            title: SmallText(
              text: 'Product Description*',
              size: 57.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.c333333_100,
            ),
            subtitle: TextFormField(
              maxLines: 5,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                } else if (!RegExp(
                        r'^([\w\s.,!?~!@#$%^&<>*()_+{}[\]:;"\/?-]+ ){0,99}[\w\s.,!?~!@#$%^&*()_+{}[\]:;"\/?-]+$')
                    .hasMatch(value)) {
                  return 'Product description does not exceed 100 words';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                productDescription = value;
              },
              style: GoogleFonts.inter(
                  fontSize: 57.sp,
                  color: AppColors.cC8151D_100,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                errorStyle: GoogleFonts.inter(fontSize: 36.sp),
                hintText: 'Product Description',
                hintStyle: GoogleFonts.inter(
                    fontSize: 57.sp,
                    color: AppColors.c333333_30,
                    fontWeight: FontWeight.w500),
                border: InputBorder.none,
              ),
            ),
            // trailing: SmallText(
            //   text: '0/100',
            //   size: 57.sp,
            //   color: AppColors.c333333_30,
            //   fontWeight: FontWeight.w500,
            // ),
          ),
          // Divider(
          //   height: 2.h,
          //   color: AppColors.c333333_30,
          // ),
          // Container(
          //   alignment: Alignment.center,
          //   height: 200.h,
          //   width: double.maxFinite,
          //   child: ListTile(
          //     leading: Icon(
          //       Icons.list_rounded,
          //       size: 100.sp,
          //       color: AppColors.c000000_100,
          //     ),
          //     title: SmallText(
          //       text: 'Category',
          //       size: 57.sp,
          //       fontWeight: FontWeight.w500,
          //       color: AppColors.c333333_100,
          //     ),
          //     trailing: Icon(
          //       Icons.arrow_forward_ios,
          //       size: 63.sp,
          //       color: AppColors.c000000_45,
          //     ),
          //   ),
          // ),
          Divider(
            height: 2.h,
            color: AppColors.c333333_30,
          ),
          Container(
            alignment: Alignment.center,
            height: 200.h,
            width: double.maxFinite,
            child: ListTile(
                leading: Icon(
                  Icons.price_change,
                  size: 100.sp,
                  color: AppColors.c333333_100,
                ),
                title: SmallText(
                  text: role == 'admin' ? 'Price' : 'Starting price',
                  size: 57.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.c333333_100,
                ),
                trailing: SizedBox(
                  width: 245.w,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      } else if (!RegExp(r'^\d+(\.\d{1,2})?$')
                          .hasMatch(value)) {
                        return 'Number only';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setPrice = double.parse(value);
                    },
                    style: GoogleFonts.inter(
                        fontSize: 57.sp,
                        color: AppColors.c333333_100,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.inter(fontSize: 36.sp),
                      hintText: 'Set price',
                      hintStyle: GoogleFonts.inter(
                          fontSize: 57.sp,
                          color: AppColors.c333333_30,
                          fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                    ),
                  ),
                )),
          ),
          Divider(
            height: 2.h,
            color: AppColors.c333333_30,
          ),
          SizedBox(
            height: 86.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 125.h,
                width: 640.w,
                child: ElevatedButton(
                    onPressed: () {
                      if (addproductkey.currentState!.validate()) {
                        if (image != null) {
                          role == 'admin'
                              ? uploadtofirebaseadmin()
                              : uploadtofirebaseadmin();
                          done(context);
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  content: SmallText(
                                    text: 'Please add photo',
                                    textAlign: TextAlign.center,
                                    size: 48.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.c000000_100,
                                  ),
                                );
                              });
                        }
                      }

                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(8)),
                      //         title: const Text('Please choose media to select'),
                      //         content: SizedBox(
                      //           height: MediaQuery.of(context).size.height / 6,
                      //           child: Column(
                      //             children: [
                      //               ElevatedButton(
                      //                 //if user click this button, user can upload image from gallery
                      //                 onPressed: () {
                      //                   Navigator.pop(context);
                      //                   getImage(ImageSource.gallery);
                      //                 },
                      //                 child: const Row(
                      //                   children: [
                      //                     Icon(Icons.image),
                      //                     Text('From Gallery'),
                      //                   ],
                      //                 ),
                      //               ),
                      //               ElevatedButton(
                      //                 //if user click this button. user can upload image from camera
                      //                 onPressed: () {
                      //                   Navigator.pop(context);
                      //                   getImage(ImageSource.camera);
                      //                 },
                      //                 child: const Row(
                      //                   children: [
                      //                     Icon(Icons.camera),
                      //                     Text('From Camera'),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     });
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)),
                        backgroundColor: AppColors.cEA2127_100),
                    child: SmallText(
                      text: 'Publish',
                      size: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.cFFFFFF_100,
                    )),
              ),
              SizedBox(
                width: 52.w,
              ),
              SizedBox(
                  height: 125.h,
                  width: 640.w,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          side: BorderSide(
                            width: 3.h,
                            color: AppColors.cC8151D_100,
                          )),
                      child: SmallText(
                        text: 'Cancel',
                        size: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cC8151D_100,
                      ))),
            ],
          ),
        ]),
      ),
    );
  }
}
