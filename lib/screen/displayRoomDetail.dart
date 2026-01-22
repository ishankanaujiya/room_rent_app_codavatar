import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        child: Container(
          child: SafeArea(child: Column(
            children: <Widget>[
             Container(
              width: double.infinity.w,
              height: 500.h,
              decoration: BoxDecoration(
                color: Color(0xFFAC8AE9),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(400.r)),
                
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Hi,", style: TextStyle(
                          color: Color.fromARGB(255, 233, 212, 51),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),),
        
                         Text("From Ramesh", style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
        
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 100,
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
                    top: 270,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: double.infinity.w,
                      height: 100.h,
                      // color: Colors.cyan,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Sea Facing Room", style: TextStyle(
                          color: Color(0xFF541678),
                          fontSize: 23.sp,
                          fontWeight: FontWeight.bold,
                        ),),

                        Text("Rs. 200", style: TextStyle(
                          color: const Color.fromARGB(255, 63, 207, 67),
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),),


                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    top: 300,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: double.infinity.w,
                      height: 100.h,
                      // color: Colors.cyan,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.location_pin, size: 15,  color: CustomColor.primaryTextColor
                                    .withOpacity(0.3),),
                          Text("Location: ", style: TextStyle(
                          color: CustomColor.primaryTextColor
                                    .withOpacity(0.3),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),),

                        Text("Baluwatar, Kathmandu", style: TextStyle(
                           color: CustomColor.primaryTextColor
                                    .withOpacity(0.3),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),),


                        ],
                      ),
                    ),
                  )
                ],
              ),
             )
            ],
          )),
        ),
      ),
    );
  }
}