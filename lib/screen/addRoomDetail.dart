import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:room_rent_app/provider/circularLoadingProvider.dart';
import 'package:room_rent_app/provider/multiplePictureDisplayProvider.dart';
import 'package:room_rent_app/service/firebaseService.dart';
import 'package:room_rent_app/service/pictureToCloudinary.dart';
import 'package:room_rent_app/util/customColor.dart';
import 'package:room_rent_app/util/keyForSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddRoomDetail extends StatefulWidget {
  const AddRoomDetail({super.key});

  @override
  State<AddRoomDetail> createState() => _AddRoomDetailState();
}

class _AddRoomDetailState extends State<AddRoomDetail> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  var roomTitleController = new TextEditingController();
  var descriptionController = new TextEditingController();
  var addressController = new TextEditingController();
  var phoneNumberController = new TextEditingController();
  var emailController = new TextEditingController();
  var roomPriceController = new TextEditingController();
  var numberOfRoomController = new TextEditingController();
  var numberofBathroomController = new TextEditingController();
  var squareFeetController = new TextEditingController();
  var electricityPriceController = new TextEditingController();
  var waterPriceController = new TextEditingController();

   List<String> secureUrlFromCloudinary = [];

  String? userFullName;
  String? userEmail;
  String? userPhoneNumber;

  getStoredValue() async
  {
    var pref = await SharedPreferences.getInstance();
    userFullName = await pref.getString(KeyForSharedPreference.KEYFORFULLNAME) ?? ""; 
    userEmail = await pref.getString(KeyForSharedPreference.KEYFOREMAIL) ?? ""; 
    userPhoneNumber = await pref.getString(KeyForSharedPreference.KEYFORPHONENUMBER) ?? ""; 

    print(userFullName);
    setState(() {
      
    });

  }

  asynchronousMethodForFetchingRoomDetail() async
  {
    await getStoredValue();
  }

  @override
  void initState()
  {
    asynchronousMethodForFetchingRoomDetail();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 237, 253),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity.w,
          decoration: BoxDecoration(
              // color: Color.fromARGB(255, 221, 207, 253),
              //  borderRadius: BorderRadius.only(
              //         // topRight: Radius.circular(50.r),
              //         bottomRight: Radius.circular(25.r)
              //         ),
              ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 221, 207, 253),
                    color: Color.fromARGB(26, 233, 226, 250),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80.w,
                        height: double.infinity.h,
                        decoration: BoxDecoration(
                            color: Color(0xFFAC8AE9),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50.r),
                                bottomRight: Radius.circular(50.r)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFAC8AE9).withOpacity(0.6),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(4, 2),
                              )
                            ]),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_left_outlined),
                            color: Color.fromARGB(255, 237, 231, 252),
                            iconSize: 30.0,
                            splashColor: Colors.transparent),
                      ),
                      SizedBox(
                        width: 50.0.w,
                      ),
                      Text(
                        "Add Room Detail",
                        style: TextStyle(
                          color: Color(0xFFAC8AE9),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity.w,
                  height: 200.h,
                  // color: Colors.cyan,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Upload Picture",
                            style: TextStyle(
                              color: Color(0xFFAC8AE9).withOpacity(0.9),
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: () 
                              {
                                 Provider.of<MultiplePictureDisplayProvider>(context, listen: false).updateSelectedPictureList();

                              },
                              icon: Icon(
                                Icons.add,
                                color: Color(0xFFAC8AE9).withOpacity(0.9),
                              ),
                              splashColor: Colors.transparent)
                        ],
                      ),
                      Container(
                        width: double.infinity.w,
                        height: 110.h,
                        child: Consumer<MultiplePictureDisplayProvider>(
                          builder: (context, displaySelectedPicture, _)
                          {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: Provider.of<MultiplePictureDisplayProvider>(context,listen: false).selectedPicture.isEmpty ? 5 : Provider.of<MultiplePictureDisplayProvider>(context,listen: false).selectedPicture.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 10.0),
                                  width: 150.w,
                                  // height: 60.h,
                                  decoration: BoxDecoration(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(25.r),
                                      ),
                                      child: Provider.of<MultiplePictureDisplayProvider>(context,listen: false).selectedPicture.isEmpty ? null : ClipRRect(
                                         borderRadius: BorderRadius.circular(25.r),
                                        child: Image.file(File(Provider.of<MultiplePictureDisplayProvider>(context,listen: false).selectedPicture[index].path), fit: BoxFit.cover,),
                                        ),
                                );
                              }
                              );
                          },
                         
                        ),
                      ),
                    ],
                  ),
                ),

                
                Form(
                  key: _formkey,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                    width: double.infinity.w,
                    // height: 90.h,
                    decoration: BoxDecoration(
                      // color: Colors.cyan,
                      border: Border.all(
                        color: CustomColor.primaryTextColor.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Room Title",
                          style: TextStyle(
                            color: Color(0xFFAC8AE9).withOpacity(0.8),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                          child: TextFormField(
                            controller: roomTitleController,
                            validator: (value)
                            {
                              if(value == null || value == "")
                              {
                                return "Room Title is required";
                              }
                            },
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              color:
                                  CustomColor.primaryTextColor.withOpacity(0.8),
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                    width: double.infinity.w,
                    // height: 90.h,
                    decoration: BoxDecoration(
                      // color: Colors.cyan,
                      border: Border.all(
                        color: CustomColor.primaryTextColor.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Description",
                          style: TextStyle(
                            color: Color(0xFFAC8AE9).withOpacity(0.8),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 90.h,
                          child: TextFormField(
                            controller: descriptionController,
                            validator: (value)
                            {
                              if(value == null || value == "")
                              {
                                return "Description is required";
                              }
                            },
                            maxLines: 6,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              color:
                                  CustomColor.primaryTextColor.withOpacity(0.8),
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   margin:
                  //       EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  //   // color: Colors.cyan,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       Text(
                  //         "Location",
                  //         style: TextStyle(
                  //           color: Color(0xFFAC8AE9).withOpacity(0.9),
                  //           fontSize: 11.sp,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 15.h,
                  //       ),
                  //       Container(
                  //         // margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  //         width: double.infinity.w,
                  //         height: 200.h,
                  //         decoration: BoxDecoration(
                  //             color:
                  //                 CustomColor.primaryTextColor.withOpacity(0.1),
                  //             borderRadius: BorderRadius.circular(25.r)),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                   SizedBox(
                          height: 20.h,
                        ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.only(
                        left: 0.0, right: 15.0, top: 5.0, bottom: 10.0),
                    width: double.infinity.w,
                    // height: 90.h,
                    decoration: BoxDecoration(
                      // color: Colors.cyan,
                      border: Border.all(
                        color: CustomColor.primaryTextColor.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: SizedBox(
                      width: 300.w,
                      height: 40.h,
                      child: TextFormField(
                        controller: addressController,
                            validator: (value)
                            {
                              if(value == null || value == "")
                              {
                                return "Address is required";
                              }
                            },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 1),
                          hintText: "Address",
                          hintStyle: TextStyle(
                            color: CustomColor.primaryTextColor.withOpacity(0.2),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIcon: Icon(
                            Icons.location_pin,
                            color: Color(0xFFAC8AE9).withOpacity(0.8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: CustomColor.primaryTextColor.withOpacity(0.8),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.only(
                        left: 0.0, right: 15.0, top: 5.0, bottom: 10.0),
                    width: double.infinity.w,
                    // height: 90.h,
                    decoration: BoxDecoration(
                      // color: Colors.cyan,
                      border: Border.all(
                        color: CustomColor.primaryTextColor.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: SizedBox(
                      width: 300.w,
                      height: 40.h,
                      child: TextFormField(
                        controller: phoneNumberController,
                            validator: (value)
                            {
                              if(value == null || value == "")
                              {
                                return "Phone Number is required";
                              }
                              if(value.length <10 || value.length >10)
                              {
                                return "Phone Number must be of 10 digit";
                              }
                            },
                            keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 1),
                          hintText: "Contact Number",
                          hintStyle: TextStyle(
                            color: CustomColor.primaryTextColor.withOpacity(0.2),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIcon: Icon(
                            Icons.call,
                            color: Color(0xFFAC8AE9).withOpacity(0.8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: CustomColor.primaryTextColor.withOpacity(0.8),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.only(
                        left: 0.0, right: 15.0, top: 5.0, bottom: 10.0),
                    width: double.infinity.w,
                    // height: 90.h,
                    decoration: BoxDecoration(
                      // color: Colors.cyan,
                      border: Border.all(
                        color: CustomColor.primaryTextColor.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: SizedBox(
                      width: 300.w,
                      height: 40.h,
                      child: TextFormField(
                        controller: emailController,
                            validator: (value)
                            {
                              if(value == null || value == "")
                              {
                                return "Email is required";
                              }
                              if(!value.contains("@gmail.com"))
                              {
                                return "Enter Valid Email";
                              }
                            },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 1),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: CustomColor.primaryTextColor.withOpacity(0.2),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xFFAC8AE9).withOpacity(0.8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: CustomColor.primaryTextColor.withOpacity(0.8),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                                 
                  
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    // color: Colors.cyan,
                    width: double.infinity.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Detail",
                          style: TextStyle(
                            color: Color(0xFFAC8AE9).withOpacity(0.9),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 160.w,
                              height: 40.h,
                              child: TextFormField(
                                controller: roomPriceController,
                                validator: (value)
                                {
                                  if(value == null || value == "")
                                  {
                                    return "Room Price is required";
                                  }
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 1),
                                  hintText: "Rs. Price per month",
                                  hintStyle: TextStyle(
                                    color: CustomColor.primaryTextColor
                                        .withOpacity(0.2),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.price_check_rounded,
                                    color: Color(0xFFAC8AE9).withOpacity(0.8),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: CustomColor.primaryTextColor
                                      .withOpacity(0.8),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 160.w,
                              height: 40.h,
                              child: TextFormField(
                                controller: numberOfRoomController,
                                validator: (value)
                                {
                                  if(value == null || value == "")
                                  {
                                    return "Enter Number of Rooms";
                                  }
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 1),
                                  hintText: "No. of Rooms",
                                  hintStyle: TextStyle(
                                    color: CustomColor.primaryTextColor
                                        .withOpacity(0.2),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.bed,
                                    color: Color(0xFFAC8AE9).withOpacity(0.8),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: CustomColor.primaryTextColor
                                      .withOpacity(0.8),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 160.w,
                              height: 40.h,
                              child: TextFormField(
                                controller: numberofBathroomController,
                                validator: (value)
                                {
                                  if(value == null || value == "")
                                  {
                                    return "Enter Number of Bathroom";
                                  }
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 1),
                                  hintText: "No. of Bathroom",
                                  hintStyle: TextStyle(
                                    color: CustomColor.primaryTextColor
                                        .withOpacity(0.2),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.bathtub,
                                    color: Color(0xFFAC8AE9).withOpacity(0.8),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: CustomColor.primaryTextColor
                                      .withOpacity(0.8),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 160.w,
                              height: 40.h,
                              child: TextFormField(
                                controller: squareFeetController,
                                validator: (value)
                                {
                                  if(value == null || value == "")
                                  {
                                    return "Square Feet is required";
                                  }
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 1),
                                  hintText: "Square Feet",
                                  hintStyle: TextStyle(
                                    color: CustomColor.primaryTextColor
                                        .withOpacity(0.2),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.area_chart,
                                    color: Color(0xFFAC8AE9).withOpacity(0.8),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: CustomColor.primaryTextColor
                                      .withOpacity(0.8),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 160.w,
                              height: 40.h,
                              child: TextFormField(
                                controller: electricityPriceController,
                                validator: (value)
                                {
                                  if(value == null || value == "")
                                  {
                                    return "Electricity Price is required";
                                  }
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 1),
                                  hintText: "Electricity Price (Per)",
                                  hintStyle: TextStyle(
                                    color: CustomColor.primaryTextColor
                                        .withOpacity(0.2),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.electric_bolt,
                                    color: Color(0xFFAC8AE9).withOpacity(0.8),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: CustomColor.primaryTextColor
                                      .withOpacity(0.8),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 160.w,
                              height: 40.h,
                              child: TextFormField(
                                controller: waterPriceController,
                                validator: (value)
                                {
                                  if(value == null || value == "")
                                  {
                                    return "Water Price is required";
                                  }
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 1),
                                  hintText: "Water Price (per)",
                                  hintStyle: TextStyle(
                                    color: CustomColor.primaryTextColor
                                        .withOpacity(0.2),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.water_drop_rounded,
                                    color: Color(0xFFAC8AE9).withOpacity(0.8),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: CustomColor.primaryTextColor
                                      .withOpacity(0.8),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                      ],
                      ),
                  
                  ),
                ),
                

                Consumer<MultiplePictureDisplayProvider>(
                  builder: (context, validateField, _)
                  {
                    return InkWell(
                    onTap: () async
                    {
                      await Provider.of<CircularLoadingProvider>(context, listen: false).changeLoadingStatus(true);
                      if(_formkey.currentState!.validate())
                      {
                        if(validateField.selectedPicture.isNotEmpty)
                        {
                          secureUrlFromCloudinary.clear();
                           for(int i = 0; i<Provider.of<MultiplePictureDisplayProvider>(context,listen: false).selectedPicture.length; i++)
                            {
                              XFile? selectedPicturePath = await Provider.of<MultiplePictureDisplayProvider>(context,listen: false).selectedPicture[i];
                              File? convertedValue = File(selectedPicturePath.path);

                            String secureUrl = await PictureToCloudinary().uploadPictureToCloudinary(convertedValue);
                            secureUrlFromCloudinary.add(secureUrl);
                            
                            }

                          if(secureUrlFromCloudinary.isNotEmpty)
                          {
                            Map<String, dynamic> roomDetail = {
                              "Full Name" : userFullName,
                              "Email" : userEmail,
                              "Phone Number" : userPhoneNumber,
                              "secureUrl" : secureUrlFromCloudinary,
                              "Room Title" : roomTitleController.text,
                              "Description" : descriptionController.text,
                              "Location" : addressController.text,
                              "Contact Number" : phoneNumberController.text,
                              "Contact Email" : emailController.text,
                              "Room Price" : roomPriceController.text,
                              "Number Of Room" : numberOfRoomController.text,
                              "Number Of Bathroom" : numberofBathroomController.text,
                              "Square Feet" : squareFeetController.text,
                              "Electricity Price" : electricityPriceController.text,
                              "Water Price" : waterPriceController.text,
                              "TimeStamp" : FieldValue.serverTimestamp(),
                            };

                            await FirebaseService().storeRoomDetail(roomDetail);

                            await Provider.of<CircularLoadingProvider>(context, listen: false).changeLoadingStatus(false);

                            print("Room Details Stored In FirebaseFirestore");

                            

                            
                          }
                          print("Value are");
                          print(secureUrlFromCloudinary);

                          
                        }
                        else
                        {
                          await Future.delayed(Duration(seconds: 2));
                          await Provider.of<CircularLoadingProvider>(context, listen: false).changeLoadingStatus(false);
                          print("Upload room Photo");
                        }
                      }
                      else
                      {
                        await Future.delayed(Duration(seconds: 2));
                        
                        await Provider.of<CircularLoadingProvider>(context, listen: false).changeLoadingStatus(false);
                      }
                    },
                    child: Consumer<CircularLoadingProvider>(
                      builder: (context, circularLoading, _)
                      {
                        return Container(
                        width: 325.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xFF5C1196).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Center(
                            child: Provider.of<CircularLoadingProvider>(context).isLoading ? CircularProgressIndicator() 
                            :
                             Text(
                          "Publish Room",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      );
                      },
                      
                    ),
                  );  
                  },
                  
                ),

                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
