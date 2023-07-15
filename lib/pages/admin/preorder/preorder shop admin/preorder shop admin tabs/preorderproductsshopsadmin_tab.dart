import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoop3/widgets/areyousure.dart';
import 'package:ecoop3/widgets/done.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/my_package.dart';
import '../../../../../widgets/loadinghairil.dart';
import '../../../../../widgets/cupertinocontextmenuaction.dart';
import '../../../../../widgets/smalltext.dart';

class MyShopProductContent extends StatefulWidget {
  const MyShopProductContent({super.key});

  @override
  State<MyShopProductContent> createState() => _MyShopProductContentState();
}

class _MyShopProductContentState extends State<MyShopProductContent> {
  // XFile? image;

  // final ImagePicker picker = ImagePicker();

  // Future getImage(ImageSource media) async {
  //   var img = await picker.pickImage(source: media);

  //   setState(() {
  //     image = img;
  //   });
  // }

  // Future<void> editProductFunction() async {
  //   // final file = File(image!.path);
  //   // TaskSnapshot snapshot = await FirebaseStorage.instance
  //   //     .ref()
  //   //     .child("preorder_product_image/$productName")
  //   //     .putFile(file);
  //   // if (snapshot.state == TaskState.success) {
  //   //   final String downloadUrl = await snapshot.ref.getDownloadURL();
  //   //   FirebaseFirestore.instance
  //   //       .collection("preorder_products")
  //   //       .doc(productName)
  //   //       .update({
  //   //     "url": downloadUrl,
  //   //     "name": editproductName,
  //   //     "description": editproductDescription,
  //   //     "RM": editsetPrice,
  //   //   });
  //   //   Navigator.pop(context);
  //   // } else {}
  //   FirebaseFirestore.instance
  //       .collection("preorder_products")
  //       .doc(productName)
  //       .update({
  //     // "url": downloadUrl,
  //     "name": editproductName,
  //     "description": editproductDescription,
  //     "RM": editsetPrice,
  //   });
  // }

  // //show popup dialog
  // void myAlert() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //           title: const Text('Please choose media to select'),
  //           content: SizedBox(
  //             height: MediaQuery.of(context).size.height / 6,
  //             child: Column(
  //               children: [
  //                 ElevatedButton(
  //                   //if user click this button, user can upload image from gallery
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                     getImage(ImageSource.gallery);
  //                   },
  //                   child: const Row(
  //                     children: [
  //                       Icon(Icons.image),
  //                       Text('From Gallery'),
  //                     ],
  //                   ),
  //                 ),
  //                 ElevatedButton(
  //                   //if user click this button. user can upload image from camera
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                     getImage(ImageSource.camera);
  //                   },
  //                   child: const Row(
  //                     children: [
  //                       Icon(Icons.camera),
  //                       Text('From Camera'),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 32.h),
              child: SmallText(
                text: 'In Stock',
                size: 48.sp,
                color: AppColors.c000000_100,
                fontWeight: FontWeight.bold,
              ),
            )),
        SizedBox(
          child: StreamBuilder(
            stream: getAvailableProducts(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingHairil();
              }
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 32.h,
                      crossAxisSpacing: 32.h,
                    ),
                    itemCount: (snapshot.data?.docs.length ?? 0),
                    itemBuilder: (BuildContext context, int index) {
                      return GridTile(
                          child: CupertinoContextMenu(
                        actions: [
                          MyCupertinoContextMenuAction(
                              trailingIcon: Icons.remove_shopping_cart_outlined,
                              text: 'Out of stock',
                              size: 48.sp,
                              onpressed: () {
                                areyousure(context, onPressedYes: () {
                                  FirebaseFirestore.instance
                                      .collection('preorder_products')
                                      .doc(snapshot.data!.docs[index]
                                          .get("name"))
                                      .update({'instock': false});
                                  Navigator.pop(context);
                                  done(context);
                                });
                              }),
                          // MyCupertinoContextMenuAction(
                          //     trailingIcon: Icons.edit_outlined,
                          //     text: 'Edit',
                          //     size: 48.sp,
                          //     onpressed: () {
                          //       Navigator.pop(context);
                          //       showBottomSheet(
                          //           context: context,
                          //           builder: (BuildContext context) {
                          //             final addproductkey =
                          //                 GlobalKey<FormState>();
                          //             return Scaffold(
                          //               resizeToAvoidBottomInset: false,
                          //               body: SafeArea(
                          //                   child: SingleChildScrollView(
                          //                 child: Stack(
                          //                   children: [
                          //                     Image.asset(
                          //                         'assets/images/bghomepage.png',
                          //                         fit: BoxFit.cover,
                          //                         width:
                          //                             1620.w),
                          //                     Padding(
                          //                       padding: EdgeInsets.only(
                          //                           top: 32.h,
                          //                           left:
                          //                               118.w,
                          //                           right: Dimentions
                          //                               .width75_52),
                          //                       child: Form(
                          //                         key: addproductkey,
                          //                         child: Column(
                          //                             crossAxisAlignment:
                          //                                 CrossAxisAlignment
                          //                                     .start,
                          //                             children: [
                          //                               Stack(children: [
                          //                                 const MyBackButton(),
                          //                                 Align(
                          //                                     alignment:
                          //                                         Alignment
                          //                                             .center,
                          //                                     child: BigText(
                          //                                       text:
                          //                                           'Product',
                          //                                       size: Dimentions
                          //                                           64.sp,
                          //                                       color: AppColors
                          //                                           .c333333_100,
                          //                                     ))
                          //                               ]),
                          //                               SizedBox(
                          //                                 height: Dimentions
                          //                                     .height61_44,
                          //                               ),
                          //                               GestureDetector(
                          //                                 onTap: () {
                          //                                   myAlert();
                          //                                 },
                          //                                 child: SizedBox(
                          //                                   height: Dimentions
                          //                                       .height320,
                          //                                   width: Dimentions
                          //                                       .height320,
                          //                                   child: ClipRRect(
                          //                                       borderRadius:
                          //                                           BorderRadius.circular(
                          //                                               Dimentions
                          //                                                   30.r),
                          //                                       child: image !=
                          //                                               null
                          //                                           ? Image
                          //                                               .file(
                          //                                               //to show image, you type like this.
                          //                                               File(image!
                          //                                                   .path),
                          //                                               fit: BoxFit
                          //                                                   .cover,
                          //                                             )
                          //                                           : Image
                          //                                               .network(
                          //                                               snapshot
                          //                                                   .data!
                          //                                                   .docs[index]
                          //                                                   .get("url"),
                          //                                               fit: BoxFit
                          //                                                   .cover,
                          //                                             )),
                          //                                 ),
                          //                               ),
                          //                               // image != null
                          //                               //     ? GestureDetector(
                          //                               //         onTap: () {
                          //                               //           myAlert();
                          //                               //         },
                          //                               //         child:
                          //                               //             SizedBox(
                          //                               //           height: Dimentions
                          //                               //               .height320,
                          //                               //           width: Dimentions
                          //                               //               .height320,
                          //                               //           child:
                          //                               //               ClipRRect(
                          //                               //             borderRadius:
                          //                               //                 BorderRadius.circular(
                          //                               //                     30.r),
                          //                               //             child: Image
                          //                               //                 .file(
                          //                               //               //to show image, you type like this.
                          //                               //               File(image!
                          //                               //                   .path),
                          //                               //               fit: BoxFit
                          //                               //                   .cover,
                          //                               //             ),
                          //                               //           ),
                          //                               //         ),
                          //                               //       )
                          //                               //     : GestureDetector(
                          //                               //         onTap: () {
                          //                               //           myAlert();
                          //                               //         },
                          //                               //         child: SizedBox(
                          //                               //             height: 500.h,
                          //                               //             width: 500.h,
                          //                               //             child: ClipRRect(
                          //                               //                 borderRadius: BorderRadius.circular(30.r),
                          //                               //                 child: Image.network(
                          //                               //                   snapshot.data!.docs[index].get("url"),
                          //                               //                   fit:
                          //                               //                       BoxFit.cover,
                          //                               //                 ))),
                          //                               //       ),
                          //                               SizedBox(
                          //                                 height: Dimentions
                          //                                     .height88_32,
                          //                               ),
                          //                               ListTile(
                          //                                 title: SmallText(
                          //                                   text:
                          //                                       'Product Name*',
                          //                                   size: Dimentions
                          //                                       57.sp,
                          //                                   fontWeight:
                          //                                       FontWeight
                          //                                           .w500,
                          //                                   color: AppColors
                          //                                       .c333333_100,
                          //                                 ),
                          //                                 subtitle:
                          //                                     TextFormField(
                          //                                   validator:
                          //                                       (value) {
                          //                                     if (value!
                          //                                         .isEmpty) {
                          //                                       return null;
                          //                                     }
                          //                                     if (!RegExp(
                          //                                             r'^[A-Za-z ]{1,20}$')
                          //                                         .hasMatch(
                          //                                             value)) {
                          //                                       return 'Product name cannot contain symbol or number';
                          //                                     }
                          //                                     return null;
                          //                                   },
                          //                                   onChanged:
                          //                                       (value) {
                          //                                     editproductName =
                          //                                         value;
                          //                                   },
                          //                                   style: GoogleFonts.inter(
                          //                                       fontSize:
                          //                                           Dimentions
                          //                                               57.sp,
                          //                                       color: AppColors
                          //                                           .cC8151D_100,
                          //                                       fontWeight:
                          //                                           FontWeight
                          //                                               .w500),
                          //                                   decoration: InputDecoration(
                          //                                       errorStyle: GoogleFonts.inter(
                          //                                           fontSize:
                          //                                               Dimentions
                          //                                                   .font23_04),
                          //                                       hintText: snapshot
                          //                                           .data!
                          //                                           .docs[
                          //                                               index]
                          //                                           .get(
                          //                                               "name"),
                          //                                       hintStyle: GoogleFonts.inter(
                          //                                           fontSize:
                          //                                               Dimentions
                          //                                                   57.sp,
                          //                                           color: AppColors
                          //                                               .cC8151D_100,
                          //                                           fontWeight:
                          //                                               FontWeight
                          //                                                   .w500),
                          //                                       border:
                          //                                           InputBorder
                          //                                               .none),
                          //                                 ),
                          //                                 // trailing: SmallText(
                          //                                 //   text: '0/100',
                          //                                 //   size: 57.sp,
                          //                                 //   color: AppColors.c333333_30,
                          //                                 //   fontWeight: FontWeight.w500,
                          //                                 // ),
                          //                               ),
                          //                               SizedBox(
                          //                                 height: Dimentions
                          //                                     .height60_51,
                          //                               ),
                          //                               ListTile(
                          //                                 title: SmallText(
                          //                                   text:
                          //                                       'Product Description',
                          //                                   size: Dimentions
                          //                                       57.sp,
                          //                                   fontWeight:
                          //                                       FontWeight
                          //                                           .w500,
                          //                                   color: AppColors
                          //                                       .c333333_100,
                          //                                 ),
                          //                                 subtitle:
                          //                                     TextFormField(
                          //                                   maxLines: 5,
                          //                                   textInputAction:
                          //                                       TextInputAction
                          //                                           .next,
                          //                                   validator:
                          //                                       (value) {
                          //                                     if (value!
                          //                                         .isEmpty) {
                          //                                       return null;
                          //                                     }
                          //                                     if (!RegExp(
                          //                                             r'^([\w\s.,!?~!@#$%^&<>*()_+{}[\]:;"\/?-]+ ){0,99}[\w\s.,!?~!@#$%^&*()_+{}[\]:;"\/?-]+$')
                          //                                         .hasMatch(
                          //                                             value)) {
                          //                                       return 'Product description does not exceed 100 words';
                          //                                     }
                          //                                     return null;
                          //                                   },
                          //                                   onChanged:
                          //                                       (value) {
                          //                                     editproductDescription =
                          //                                         value;
                          //                                   },
                          //                                   style: GoogleFonts.inter(
                          //                                       fontSize:
                          //                                           Dimentions
                          //                                               57.sp,
                          //                                       color: AppColors
                          //                                           .cC8151D_100,
                          //                                       fontWeight:
                          //                                           FontWeight
                          //                                               .w500),
                          //                                   decoration:
                          //                                       InputDecoration(
                          //                                     errorStyle: GoogleFonts.inter(
                          //                                         fontSize:
                          //                                             Dimentions
                          //                                                 .font23_04),
                          //                                     hintText: snapshot
                          //                                         .data!
                          //                                         .docs[index]
                          //                                         .get(
                          //                                             "description"),
                          //                                     hintStyle: GoogleFonts.inter(
                          //                                         fontSize:
                          //                                             Dimentions
                          //                                                 57.sp,
                          //                                         color: AppColors
                          //                                             .cC8151D_100,
                          //                                         fontWeight:
                          //                                             FontWeight
                          //                                                 .w500),
                          //                                     border:
                          //                                         InputBorder
                          //                                             .none,
                          //                                   ),
                          //                                 ),
                          //                                 // trailing: SmallText(
                          //                                 //   text: '0/100',
                          //                                 //   size: 57.sp,
                          //                                 //   color: AppColors.c333333_30,
                          //                                 //   fontWeight: FontWeight.w500,
                          //                                 // ),
                          //                               ),
                          //                               // Divider(
                          //                               //   height: 2.h,
                          //                               //   color: AppColors.c333333_30,
                          //                               // ),
                          //                               // Container(
                          //                               //   alignment: Alignment.center,
                          //                               //   height: 200.h,
                          //                               //   width: double.maxFinite,
                          //                               //   child: ListTile(
                          //                               //     leading: Icon(
                          //                               //       Icons.list_rounded,
                          //                               //       size: 100.sp,
                          //                               //       color: AppColors.c000000_100,
                          //                               //     ),
                          //                               //     title: SmallText(
                          //                               //       text: 'Category',
                          //                               //       size: 57.sp,
                          //                               //       fontWeight: FontWeight.w500,
                          //                               //       color: AppColors.c333333_100,
                          //                               //     ),
                          //                               //     trailing: Icon(
                          //                               //       Icons.arrow_forward_ios,
                          //                               //       size: 63.sp,
                          //                               //       color: AppColors.c000000_45,
                          //                               //     ),
                          //                               //   ),
                          //                               // ),
                          //                               Divider(
                          //                                 height: Dimentions
                          //                                     2.h,
                          //                                 color: AppColors
                          //                                     .c333333_30,
                          //                               ),
                          //                               Container(
                          //                                 alignment: Alignment
                          //                                     .center,
                          //                                 height: Dimentions
                          //                                     200.h,
                          //                                 width: double
                          //                                     .maxFinite,
                          //                                 child: ListTile(
                          //                                     leading: Icon(
                          //                                       Icons
                          //                                           .price_change,
                          //                                       size: Dimentions
                          //                                           .icon64,
                          //                                       color: AppColors
                          //                                           .c333333_100,
                          //                                     ),
                          //                                     title:
                          //                                         SmallText(
                          //                                       text: 'Price',
                          //                                       size: Dimentions
                          //                                           57.sp,
                          //                                       fontWeight:
                          //                                           FontWeight
                          //                                               .w500,
                          //                                       color: AppColors
                          //                                           .c333333_100,
                          //                                     ),
                          //                                     trailing:
                          //                                         SizedBox(
                          //                                       width: Dimentions
                          //                                           .width156_8,
                          //                                       child:
                          //                                           TextFormField(
                          //                                         validator:
                          //                                             (value) {
                          //                                           if (value!
                          //                                               .isEmpty) {
                          //                                             return null;
                          //                                           }
                          //                                           if (!RegExp(
                          //                                                   r'^\d+(\.\d{1,2})?$')
                          //                                               .hasMatch(
                          //                                                   value)) {
                          //                                             return 'Number only';
                          //                                           }
                          //                                           return null;
                          //                                         },
                          //                                         onChanged:
                          //                                             (value) {
                          //                                           editsetPrice =
                          //                                               double.parse(
                          //                                                   value);
                          //                                         },
                          //                                         style: GoogleFonts.inter(
                          //                                             fontSize:
                          //                                                 Dimentions
                          //                                                     57.sp,
                          //                                             color: AppColors
                          //                                                 .c333333_100,
                          //                                             fontWeight:
                          //                                                 FontWeight.w500),
                          //                                         decoration:
                          //                                             InputDecoration(
                          //                                           errorStyle:
                          //                                               GoogleFonts.inter(
                          //                                                   fontSize: 36.sp),
                          //                                           hintText: snapshot
                          //                                               .data!
                          //                                               .docs[
                          //                                                   index]
                          //                                               .get(
                          //                                                   "RM")
                          //                                               .toStringAsFixed(
                          //                                                   2),
                          //                                           hintStyle: GoogleFonts.inter(
                          //                                               fontSize: Dimentions
                          //                                                   57.sp,
                          //                                               color: AppColors
                          //                                                   .c333333_100,
                          //                                               fontWeight:
                          //                                                   FontWeight.w500),
                          //                                           border: InputBorder
                          //                                               .none,
                          //                                         ),
                          //                                       ),
                          //                                     )),
                          //                               ),
                          //                               Divider(
                          //                                 height: Dimentions
                          //                                     2.h,
                          //                                 color: AppColors
                          //                                     .c333333_30,
                          //                               ),
                          //                               SizedBox(
                          //                                 height: Dimentions
                          //                                     .height55_04,
                          //                               ),
                          //                               Align(
                          //                                 alignment: Alignment
                          //                                     .topCenter,
                          //                                 child:
                          //                                     MyElevatedButton(
                          //                                         text:
                          //                                             'Confirm',
                          //                                         onPressed:
                          //                                             () {
                          //                                           if (addproductkey
                          //                                               .currentState!
                          //                                               .validate()) {
                          //                                             areyousure(
                          //                                                 context,
                          //                                                 onPressedYes:
                          //                                                     () {
                          //                                               editProductFunction();
                          //                                               Navigator.pop(
                          //                                                   context);
                          //                                             });
                          //                                           }
                          //                                         }),
                          //                               ),
                          //                             ]),
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //               )),
                          //             );
                          //           });
                          //     }),
                          // MyCupertinoContextMenuAction(
                          //     trailingIcon: Icons.percent_outlined,
                          //     text: 'Promotion',
                          //     size: 48.sp,
                          //     onpressed: () {}),
                          MyCupertinoContextMenuAction(
                              isDestructiveAction: true,
                              trailingIcon: Icons.remove_circle_outline_rounded,
                              text: 'Remove',
                              color: AppColors.cC8151D_100,
                              size: 48.sp,
                              onpressed: () {
                                areyousure(context, onPressedYes: () {
                                  deletepreorderitem(
                                      snapshot.data!.docs[index].get("name"),
                                      snapshot.data!.docs[index].get("url"));
                                  Navigator.pop(context);
                                  done(context);
                                });
                              }),
                        ],
                        child: Container(
                          padding: EdgeInsets.all(13.h),
                          height: 800.h,
                          width: 675.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      AppColors.c000000_100.withOpacity(0.3),
                                      BlendMode.darken),
                                  image: NetworkImage(
                                    snapshot.data!.docs[index].get("url"),
                                  ),
                                  fit: BoxFit.cover)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.all(65.w),
                                alignment: Alignment.topLeft,
                                child: SmallText(
                                  text: snapshot.data!.docs[index].get("name"),
                                  size: 64.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cFFFFFF_100,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: EdgeInsets.all(32.h),
                                  width: 313.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.r),
                                      color: Colors.white),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: SmallText(
                                        text:
                                            'RM ${snapshot.data!.docs[index].get("RM").toStringAsFixed(2)}',
                                        size: 48.sp,
                                        color: AppColors.c000000_100,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                    });
              }
              return Container(
                  padding: EdgeInsets.all(13.h),
                  margin: EdgeInsets.all(16.h),
                  height: 800.h,
                  width: 675.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border:
                          Border.all(color: AppColors.cC8151D_100, width: 3.h)),
                  child: Center(
                    child: SmallText(
                      text: 'No Item',
                      size: 48.sp,
                      color: AppColors.cC8151D_100,
                      fontWeight: FontWeight.w500,
                    ),
                  ));
            },
          ),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 32.h, top: 32.h),
              child: SmallText(
                text: 'Out of Stock',
                size: 48.sp,
                color: AppColors.c000000_100,
                fontWeight: FontWeight.bold,
              ),
            )),
        SizedBox(
          child: StreamBuilder(
            stream: getNotAvailableProducts(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingHairil();
              }
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 32.h,
                      crossAxisSpacing: 32.h,
                    ),
                    itemCount: (snapshot.data?.docs.length ?? 0),
                    itemBuilder: (BuildContext context, int index) {
                      return GridTile(
                          child: CupertinoContextMenu(
                        actions: [
                          MyCupertinoContextMenuAction(
                              trailingIcon: Icons.add_shopping_cart_outlined,
                              text: 'In stock',
                              size: 48.sp,
                              onpressed: () {
                                areyousure(context, onPressedYes: () {
                                  FirebaseFirestore.instance
                                      .collection('preorder_products')
                                      .doc(snapshot.data!.docs[index]
                                          .get("name"))
                                      .update({'instock': true});
                                  Navigator.pop(context);
                                  done(context);
                                });
                              }),
                          // MyCupertinoContextMenuAction(
                          //     trailingIcon: Icons.edit_outlined,
                          //     text: 'Edit',
                          //     size: 48.sp,
                          //     onpressed: () {
                          //       Navigator.pop(context);
                          //       showBottomSheet(
                          //           context: context,
                          //           builder: (BuildContext context) {
                          //             final addproductkey =
                          //                 GlobalKey<FormState>();
                          //             return Scaffold(
                          //               resizeToAvoidBottomInset: false,
                          //               body: SafeArea(
                          //                   child: SingleChildScrollView(
                          //                 child: Stack(
                          //                   children: [
                          //                     Image.asset(
                          //                         'assets/images/bghomepage.png',
                          //                         fit: BoxFit.cover,
                          //                         width:
                          //                             1620.w),
                          //                     Padding(
                          //                       padding: EdgeInsets.only(
                          //                           top: 32.h,
                          //                           left:
                          //                               118.w,
                          //                           right: Dimentions
                          //                               .width75_52),
                          //                       child: Form(
                          //                         key: addproductkey,
                          //                         child: Column(
                          //                             crossAxisAlignment:
                          //                                 CrossAxisAlignment
                          //                                     .start,
                          //                             children: [
                          //                               Stack(children: [
                          //                                 const MyBackButton(),
                          //                                 Align(
                          //                                     alignment:
                          //                                         Alignment
                          //                                             .center,
                          //                                     child: BigText(
                          //                                       text:
                          //                                           'Product',
                          //                                       size: Dimentions
                          //                                           64.sp,
                          //                                       color: AppColors
                          //                                           .c333333_100,
                          //                                     ))
                          //                               ]),
                          //                               SizedBox(
                          //                                 height: Dimentions
                          //                                     .height61_44,
                          //                               ),
                          //                               GestureDetector(
                          //                                 onTap: () {
                          //                                   myAlert();
                          //                                 },
                          //                                 child: SizedBox(
                          //                                   height: Dimentions
                          //                                       .height320,
                          //                                   width: Dimentions
                          //                                       .height320,
                          //                                   child: ClipRRect(
                          //                                       borderRadius:
                          //                                           BorderRadius.circular(
                          //                                               Dimentions
                          //                                                   30.r),
                          //                                       child: image !=
                          //                                               null
                          //                                           ? Image
                          //                                               .file(
                          //                                               //to show image, you type like this.
                          //                                               File(image!
                          //                                                   .path),
                          //                                               fit: BoxFit
                          //                                                   .cover,
                          //                                             )
                          //                                           : Image
                          //                                               .network(
                          //                                               snapshot
                          //                                                   .data!
                          //                                                   .docs[index]
                          //                                                   .get("url"),
                          //                                               fit: BoxFit
                          //                                                   .cover,
                          //                                             )),
                          //                                 ),
                          //                               ),
                          //                               // image != null
                          //                               //     ? GestureDetector(
                          //                               //         onTap: () {
                          //                               //           myAlert();
                          //                               //         },
                          //                               //         child:
                          //                               //             SizedBox(
                          //                               //           height: Dimentions
                          //                               //               .height320,
                          //                               //           width: Dimentions
                          //                               //               .height320,
                          //                               //           child:
                          //                               //               ClipRRect(
                          //                               //             borderRadius:
                          //                               //                 BorderRadius.circular(
                          //                               //                     30.r),
                          //                               //             child: Image
                          //                               //                 .file(
                          //                               //               //to show image, you type like this.
                          //                               //               File(image!
                          //                               //                   .path),
                          //                               //               fit: BoxFit
                          //                               //                   .cover,
                          //                               //             ),
                          //                               //           ),
                          //                               //         ),
                          //                               //       )
                          //                               //     : GestureDetector(
                          //                               //         onTap: () {
                          //                               //           myAlert();
                          //                               //         },
                          //                               //         child: SizedBox(
                          //                               //             height: 500.h,
                          //                               //             width: 500.h,
                          //                               //             child: ClipRRect(
                          //                               //                 borderRadius: BorderRadius.circular(30.r),
                          //                               //                 child: Image.network(
                          //                               //                   snapshot.data!.docs[index].get("url"),
                          //                               //                   fit:
                          //                               //                       BoxFit.cover,
                          //                               //                 ))),
                          //                               //       ),
                          //                               SizedBox(
                          //                                 height: Dimentions
                          //                                     .height88_32,
                          //                               ),
                          //                               ListTile(
                          //                                 title: SmallText(
                          //                                   text:
                          //                                       'Product Name*',
                          //                                   size: Dimentions
                          //                                       57.sp,
                          //                                   fontWeight:
                          //                                       FontWeight
                          //                                           .w500,
                          //                                   color: AppColors
                          //                                       .c333333_100,
                          //                                 ),
                          //                                 subtitle:
                          //                                     TextFormField(
                          //                                   validator:
                          //                                       (value) {
                          //                                     if (value!
                          //                                         .isEmpty) {
                          //                                       return null;
                          //                                     }
                          //                                     if (!RegExp(
                          //                                             r'^[A-Za-z ]{1,20}$')
                          //                                         .hasMatch(
                          //                                             value)) {
                          //                                       return 'Product name cannot contain symbol or number';
                          //                                     }
                          //                                     return null;
                          //                                   },
                          //                                   onChanged:
                          //                                       (value) {
                          //                                     editproductName =
                          //                                         value;
                          //                                   },
                          //                                   style: GoogleFonts.inter(
                          //                                       fontSize:
                          //                                           Dimentions
                          //                                               57.sp,
                          //                                       color: AppColors
                          //                                           .cC8151D_100,
                          //                                       fontWeight:
                          //                                           FontWeight
                          //                                               .w500),
                          //                                   decoration: InputDecoration(
                          //                                       errorStyle: GoogleFonts.inter(
                          //                                           fontSize:
                          //                                               Dimentions
                          //                                                   .font23_04),
                          //                                       hintText: snapshot
                          //                                           .data!
                          //                                           .docs[
                          //                                               index]
                          //                                           .get(
                          //                                               "name"),
                          //                                       hintStyle: GoogleFonts.inter(
                          //                                           fontSize:
                          //                                               Dimentions
                          //                                                   57.sp,
                          //                                           color: AppColors
                          //                                               .cC8151D_100,
                          //                                           fontWeight:
                          //                                               FontWeight
                          //                                                   .w500),
                          //                                       border:
                          //                                           InputBorder
                          //                                               .none),
                          //                                 ),
                          //                                 // trailing: SmallText(
                          //                                 //   text: '0/100',
                          //                                 //   size: 57.sp,
                          //                                 //   color: AppColors.c333333_30,
                          //                                 //   fontWeight: FontWeight.w500,
                          //                                 // ),
                          //                               ),
                          //                               SizedBox(
                          //                                 height: Dimentions
                          //                                     .height60_51,
                          //                               ),
                          //                               ListTile(
                          //                                 title: SmallText(
                          //                                   text:
                          //                                       'Product Description',
                          //                                   size: Dimentions
                          //                                       57.sp,
                          //                                   fontWeight:
                          //                                       FontWeight
                          //                                           .w500,
                          //                                   color: AppColors
                          //                                       .c333333_100,
                          //                                 ),
                          //                                 subtitle:
                          //                                     TextFormField(
                          //                                   maxLines: 5,
                          //                                   textInputAction:
                          //                                       TextInputAction
                          //                                           .next,
                          //                                   validator:
                          //                                       (value) {
                          //                                     if (value!
                          //                                         .isEmpty) {
                          //                                       return null;
                          //                                     }
                          //                                     if (!RegExp(
                          //                                             r'^([\w\s.,!?~!@#$%^&<>*()_+{}[\]:;"\/?-]+ ){0,99}[\w\s.,!?~!@#$%^&*()_+{}[\]:;"\/?-]+$')
                          //                                         .hasMatch(
                          //                                             value)) {
                          //                                       return 'Product description does not exceed 100 words';
                          //                                     }
                          //                                     return null;
                          //                                   },
                          //                                   onChanged:
                          //                                       (value) {
                          //                                     editproductDescription =
                          //                                         value;
                          //                                   },
                          //                                   style: GoogleFonts.inter(
                          //                                       fontSize:
                          //                                           Dimentions
                          //                                               57.sp,
                          //                                       color: AppColors
                          //                                           .cC8151D_100,
                          //                                       fontWeight:
                          //                                           FontWeight
                          //                                               .w500),
                          //                                   decoration:
                          //                                       InputDecoration(
                          //                                     errorStyle: GoogleFonts.inter(
                          //                                         fontSize:
                          //                                             Dimentions
                          //                                                 .font23_04),
                          //                                     hintText: snapshot
                          //                                         .data!
                          //                                         .docs[index]
                          //                                         .get(
                          //                                             "description"),
                          //                                     hintStyle: GoogleFonts.inter(
                          //                                         fontSize:
                          //                                             Dimentions
                          //                                                 57.sp,
                          //                                         color: AppColors
                          //                                             .cC8151D_100,
                          //                                         fontWeight:
                          //                                             FontWeight
                          //                                                 .w500),
                          //                                     border:
                          //                                         InputBorder
                          //                                             .none,
                          //                                   ),
                          //                                 ),
                          //                                 // trailing: SmallText(
                          //                                 //   text: '0/100',
                          //                                 //   size: 57.sp,
                          //                                 //   color: AppColors.c333333_30,
                          //                                 //   fontWeight: FontWeight.w500,
                          //                                 // ),
                          //                               ),
                          //                               // Divider(
                          //                               //   height: 2.h,
                          //                               //   color: AppColors.c333333_30,
                          //                               // ),
                          //                               // Container(
                          //                               //   alignment: Alignment.center,
                          //                               //   height: 200.h,
                          //                               //   width: double.maxFinite,
                          //                               //   child: ListTile(
                          //                               //     leading: Icon(
                          //                               //       Icons.list_rounded,
                          //                               //       size: 100.sp,
                          //                               //       color: AppColors.c000000_100,
                          //                               //     ),
                          //                               //     title: SmallText(
                          //                               //       text: 'Category',
                          //                               //       size: 57.sp,
                          //                               //       fontWeight: FontWeight.w500,
                          //                               //       color: AppColors.c333333_100,
                          //                               //     ),
                          //                               //     trailing: Icon(
                          //                               //       Icons.arrow_forward_ios,
                          //                               //       size: 63.sp,
                          //                               //       color: AppColors.c000000_45,
                          //                               //     ),
                          //                               //   ),
                          //                               // ),
                          //                               Divider(
                          //                                 height: Dimentions
                          //                                     2.h,
                          //                                 color: AppColors
                          //                                     .c333333_30,
                          //                               ),
                          //                               Container(
                          //                                 alignment: Alignment
                          //                                     .center,
                          //                                 height: Dimentions
                          //                                     200.h,
                          //                                 width: double
                          //                                     .maxFinite,
                          //                                 child: ListTile(
                          //                                     leading: Icon(
                          //                                       Icons
                          //                                           .price_change,
                          //                                       size: Dimentions
                          //                                           .icon64,
                          //                                       color: AppColors
                          //                                           .c333333_100,
                          //                                     ),
                          //                                     title:
                          //                                         SmallText(
                          //                                       text: 'Price',
                          //                                       size: Dimentions
                          //                                           57.sp,
                          //                                       fontWeight:
                          //                                           FontWeight
                          //                                               .w500,
                          //                                       color: AppColors
                          //                                           .c333333_100,
                          //                                     ),
                          //                                     trailing:
                          //                                         SizedBox(
                          //                                       width: Dimentions
                          //                                           .width156_8,
                          //                                       child:
                          //                                           TextFormField(
                          //                                         validator:
                          //                                             (value) {
                          //                                           if (value!
                          //                                               .isEmpty) {
                          //                                             return null;
                          //                                           }
                          //                                           if (!RegExp(
                          //                                                   r'^\d+(\.\d{1,2})?$')
                          //                                               .hasMatch(
                          //                                                   value)) {
                          //                                             return 'Number only';
                          //                                           }
                          //                                           return null;
                          //                                         },
                          //                                         onChanged:
                          //                                             (value) {
                          //                                           editsetPrice =
                          //                                               double.parse(
                          //                                                   value);
                          //                                         },
                          //                                         style: GoogleFonts.inter(
                          //                                             fontSize:
                          //                                                 Dimentions
                          //                                                     57.sp,
                          //                                             color: AppColors
                          //                                                 .c333333_100,
                          //                                             fontWeight:
                          //                                                 FontWeight.w500),
                          //                                         decoration:
                          //                                             InputDecoration(
                          //                                           errorStyle:
                          //                                               GoogleFonts.inter(
                          //                                                   fontSize: 36.sp),
                          //                                           hintText: snapshot
                          //                                               .data!
                          //                                               .docs[
                          //                                                   index]
                          //                                               .get(
                          //                                                   "RM")
                          //                                               .toStringAsFixed(
                          //                                                   2),
                          //                                           hintStyle: GoogleFonts.inter(
                          //                                               fontSize: Dimentions
                          //                                                   57.sp,
                          //                                               color: AppColors
                          //                                                   .c333333_100,
                          //                                               fontWeight:
                          //                                                   FontWeight.w500),
                          //                                           border: InputBorder
                          //                                               .none,
                          //                                         ),
                          //                                       ),
                          //                                     )),
                          //                               ),
                          //                               Divider(
                          //                                 height: Dimentions
                          //                                     2.h,
                          //                                 color: AppColors
                          //                                     .c333333_30,
                          //                               ),
                          //                               SizedBox(
                          //                                 height: Dimentions
                          //                                     .height55_04,
                          //                               ),
                          //                               Align(
                          //                                 alignment: Alignment
                          //                                     .topCenter,
                          //                                 child:
                          //                                     MyElevatedButton(
                          //                                         text:
                          //                                             'Confirm',
                          //                                         onPressed:
                          //                                             () {
                          //                                           if (addproductkey
                          //                                               .currentState!
                          //                                               .validate()) {
                          //                                             areyousure(
                          //                                                 context,
                          //                                                 onPressedYes:
                          //                                                     () {
                          //                                               editProductFunction();
                          //                                               Navigator.pop(
                          //                                                   context);
                          //                                             });
                          //                                           }
                          //                                         }),
                          //                               ),
                          //                             ]),
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //               )),
                          //             );
                          //           });
                          //     }),
                          // MyCupertinoContextMenuAction(
                          //     trailingIcon: Icons.percent_outlined,
                          //     text: 'Promotion',
                          //     size: 48.sp,
                          //     onpressed: () {}),
                          MyCupertinoContextMenuAction(
                              isDestructiveAction: true,
                              trailingIcon: Icons.remove_circle_outline_rounded,
                              text: 'Remove',
                              color: AppColors.cC8151D_100,
                              size: 48.sp,
                              onpressed: () {
                                areyousure(context, onPressedYes: () {
                                  deletepreorderitem(
                                      snapshot.data!.docs[index].get("name"),
                                      snapshot.data!.docs[index].get("url"));
                                  Navigator.pop(context);
                                  done(context);
                                });
                              }),
                        ],
                        child: Container(
                          padding: EdgeInsets.all(13.h),
                          height: 800.h,
                          width: 675.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      AppColors.c000000_100.withOpacity(0.3),
                                      BlendMode.darken),
                                  image: NetworkImage(
                                    snapshot.data!.docs[index].get("url"),
                                  ),
                                  fit: BoxFit.cover)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.all(65.w),
                                alignment: Alignment.topLeft,
                                child: SmallText(
                                  text: snapshot.data!.docs[index].get("name"),
                                  size: 64.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cFFFFFF_100,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: EdgeInsets.all(32.h),
                                  width: 313.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(41.6),
                                      color: Colors.white),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: SmallText(
                                        text:
                                            'RM ${snapshot.data!.docs[index].get("RM").toStringAsFixed(2)}',
                                        size: 48.sp,
                                        color: AppColors.c000000_100,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                    });
              }
              return Container(
                  padding: EdgeInsets.all(13.h),
                  margin: EdgeInsets.all(16.h),
                  height: 800.h,
                  width: 675.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border:
                          Border.all(color: AppColors.cC8151D_100, width: 3.h)),
                  child: Center(
                    child: SmallText(
                      text: 'No Item',
                      size: 48.sp,
                      color: AppColors.cC8151D_100,
                      fontWeight: FontWeight.w500,
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
