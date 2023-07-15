import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/my_package.dart';
import '../../../../widgets/arrowback.dart';
import '../../../../widgets/bigtext.dart';
import '../../../../widgets/smalltext.dart';

class MainAddPromotionNoticeContent extends StatefulWidget {
  const MainAddPromotionNoticeContent({super.key});

  @override
  State<MainAddPromotionNoticeContent> createState() =>
      _MainAddPromotionNoticeContentState();
}

class _MainAddPromotionNoticeContentState
    extends State<MainAddPromotionNoticeContent> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  Future<void> addPromotionNoticeFunction() async {
    final file = File(image!.path);
    TaskSnapshot snapshot = await FirebaseStorage.instance
        .ref()
        .child("promotionnotice/$productName")
        .putFile(file);

    final String downloadUrl = await snapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection("promotion_notice")
        .doc(productName)
        .set({
      "url": downloadUrl,
      "promotion name": productName,
      "description": productDescription,
      "Duration": setPrice,
    });
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

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
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
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
      padding: EdgeInsets.only(
        top: 32.h,
        left: 131.w,
        right: 131.w,
      ),
      child: Column(
        children: [
          Stack(children: [
            const MyBackButton(),
            Align(
                alignment: Alignment.center,
                child: BigText(
                  text: 'Add Promotion Notice',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                ))
          ]),
          SizedBox(
            height: 120.h,
          ),
          image != null
              ? GestureDetector(
                  onTap: () {
                    myAlert();
                  },
                  child: SizedBox(
                    height: 584.h,
                    width: 1038.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Image.file(
                        //to show image, you type like this.
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
                    height: 584.h,
                    width: 1038.w,
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
            height: 150.h,
          ),
          Form(
            key: addproductkey,
            child: Column(
              children: [
                ListTile(
                  title: SmallText(
                    text: 'Duration',
                    size: 57.sp,
                    color: AppColors.c000000_100,
                    fontWeight: FontWeight.w500,
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
                          hintText: 'Date',
                          hintStyle: GoogleFonts.inter(
                              fontSize: 57.sp,
                              color: AppColors.c333333_30,
                              fontWeight: FontWeight.w500),
                          border: InputBorder.none,
                        )),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                ListTile(
                  title: SmallText(
                    text: 'Title',
                    size: 57.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_100,
                  ),
                  subtitle: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      } else if (!RegExp(r'^[A-Za-z ]{1,20}$')
                          .hasMatch(value)) {
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
                        hintText: 'Title',
                        hintStyle: GoogleFonts.inter(
                            fontSize: 57.sp,
                            color: AppColors.c333333_30,
                            fontWeight: FontWeight.w500),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                ListTile(
                  title: SmallText(
                    text: 'Description',
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
                      hintText: 'Description',
                      hintStyle: GoogleFonts.inter(
                          fontSize: 57.sp,
                          color: AppColors.c333333_30,
                          fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
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
                        addPromotionNoticeFunction();
                        Navigator.pop(context);
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
        ],
      ),
    );
  }
}
