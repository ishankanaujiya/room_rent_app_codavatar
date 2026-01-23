import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:room_rent_app/provider/roomDetailProvider.dart';
import 'package:room_rent_app/screen/home.dart';
import 'package:room_rent_app/util/customColor.dart';

class DisplayRoomDetail extends StatefulWidget {
  const DisplayRoomDetail({super.key});

  @override
  State<DisplayRoomDetail> createState() => _DisplayRoomDetailState();
}

class _DisplayRoomDetailState extends State<DisplayRoomDetail> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Consumer<RoomDetailProvider>(
          builder: (context, documentSnapshotValue, _)
          {
            final snapshot = documentSnapshotValue.documentSnapshot;

            if (snapshot == null || !snapshot.exists) {
              return Text("Null");
            }
            final value = snapshot.data() as Map<String, dynamic>;


            return Container(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity.w,
                    height: 450.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFAC8AE9),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(450.r)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          top: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Hi,",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 233, 212, 51),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                value?['Full Name'] ?? "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 90,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              padding: EdgeInsets.only(left: 20.0),
                              // margin: EdgeInsets.only(left: 20.0, right: 0.0),
                              // width: double.infinity.w,
                              height: 200.h,
                              // color: Colors.cyan,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    width: 150.w,
                                    height: 150.h,
                                    decoration: BoxDecoration(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    width: 150.w,
                                    height: 150.h,
                                    decoration: BoxDecoration(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    width: 150.w,
                                    height: 150.h,
                                    decoration: BoxDecoration(
                                      color: CustomColor.primaryTextColor
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 260,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            width: double.infinity.w,
                            height: 100.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                   value?['Room Title'] ?? "",
                                  style: TextStyle(
                                    color: Color(0xFF541678),
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                   "Rs. ${value?['Room Price']}" ?? "",
                                  style: TextStyle(
                                    color: Color(0xFF541678),
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 290,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            width: double.infinity.w,
                            height: 100.h,
                            // color: Colors.cyan,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_pin,
                                  size: 15,
                                  color: CustomColor.primaryTextColor
                                      .withOpacity(0.4),
                                ),
                                Text(
                                  "Location: ",
                                  style: TextStyle(
                                    color: CustomColor.primaryTextColor
                                        .withOpacity(0.4),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  value?['Location'] ?? "",
                                  style: TextStyle(
                                    color: CustomColor.primaryTextColor
                                        .withOpacity(0.4),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: double.infinity.w,
                    // height: 100.h,
                    // color: Colors.cyan,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Description",
                          style: TextStyle(
                            color: Color(0xFF541678),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                             value?['Description'] ?? "",
                          style: TextStyle(
                            color: CustomColor.primaryTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: double.infinity.w,
                    // height: 100.h,
                    // color: Colors.cyan,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Room Detail",
                          style: TextStyle(
                            color: Color(0xFF541678),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 20.0),
                          width: double.infinity.w,
                          // height: 200.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFAC8AE9),
                            borderRadius: BorderRadius.circular(25.r),
                          ),
          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Room Price (Per Month)",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                      "Rs. ${value?['Room Price']}" ?? "",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 233, 212, 51),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Number of Rooms",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                       value?['Number Of Room'] ?? "",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 233, 212, 51),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Number of Bathrooms",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                       value?['Number Of Bathroom'] ?? "",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 233, 212, 51),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Square Feet",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                      value?['Square Feet'] ?? "",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 233, 212, 51),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Electricity Price (Per)",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                      value?['Electricity Price'] ?? "",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 233, 212, 51),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Water Price",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                       value?['Water Price'] ?? "",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 233, 212, 51),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                  
                  Container(
                      padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                    width: double.infinity.w,
                    // height: 100.h,
                    // color: Colors.cyan,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                    "Contact Information",
                    style: TextStyle(
                      color: Color(0xFF541678),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                   value?['Contact Number'] ?? "",
                                  style: TextStyle(
                                    color: CustomColor.primaryTextColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.email,
                                  color: Colors.orangeAccent,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                     value?['Contact Email'] ?? "",
                                  style: TextStyle(
                                    color: CustomColor.primaryTextColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                          SizedBox(
                    height: 20.h,
                  ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
          },
          
        ),
      ),
    );
  }
}
