import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:room_rent_app/util/customColor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 248, 245, 255),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        width: double.infinity.w,
        child: SafeArea(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Container(
              width: double.infinity.w,
              height: 100.h,
              // color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Hello,", style: TextStyle(
                        color: CustomColor.primaryTextColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text("UserName", style: TextStyle(
                        color: CustomColor.primaryTextColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),

                  CircleAvatar(
                  backgroundColor: Color(0xFF5C1196).withOpacity(0.6),
                  radius: 35.r,
                ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                    // color: Colors.cyan,
                    //  color: Color.fromARGB(255, 213, 176, 241).withOpacity(0.1),
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r),),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity.w,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                              Container(
                        width: double.infinity.w,
                        height: 190.h,
                      
                        decoration: BoxDecoration(
                         color: Color.fromARGB(255, 114, 100, 124).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(25.r),
                       ),
                      ),
                      
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0,),
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      width: double.infinity.w,
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Text("Room Title", style: TextStyle(
                                color: CustomColor.primaryTextColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),),
                       
                              Text("Rs. 70000", style: TextStyle(
                                color: Color(0xFF5C1196),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),),
                         ],
                       ),
                     ),
                
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0,),
                      margin: EdgeInsets.symmetric(vertical: 0.0),
                      width: double.infinity.w,
                       child: Text("This is the description of the room which post is published", style: TextStyle(
                            color: CustomColor.primaryTextColor.withOpacity(0.7),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          ),
                     ),
                
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0,),
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      width: double.infinity.w,
                       child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Icon(Icons.call, color: Colors.green, size: 20,),
                           SizedBox(
                            width: 10.w,
                
                           ),
                       
                              Text("9861351391", style: TextStyle(
                                color: CustomColor.primaryTextColor.withOpacity(0.7),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),),
                         ],
                       ),
                     ),
                
                
                          ],
                        ),
                
                      ),
                      
                      SizedBox(
                        height: 20.h,
                      ),
                
                     
                     Container(
                        child: Column(
                          children: <Widget>[
                              Container(
                        width: double.infinity.w,
                        height: 190.h,
                      
                        decoration: BoxDecoration(
                         color: Color.fromARGB(255, 114, 100, 124).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(25.r),
                       ),
                      ),
                      
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0,),
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      width: double.infinity.w,
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Text("Room Title", style: TextStyle(
                                color: CustomColor.primaryTextColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),),
                       
                              Text("Rs. 70000", style: TextStyle(
                                color: Color(0xFF5C1196),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),),
                         ],
                       ),
                     ),
                
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0,),
                      margin: EdgeInsets.symmetric(vertical: 0.0),
                      width: double.infinity.w,
                       child: Text("This is the description of the room which post is published", style: TextStyle(
                            color: CustomColor.primaryTextColor.withOpacity(0.7),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          ),
                     ),
                
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0,),
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      width: double.infinity.w,
                       child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Icon(Icons.call, color: Colors.green, size: 20,),
                           SizedBox(
                            width: 10.w,
                
                           ),
                       
                              Text("9861351391", style: TextStyle(
                                color: CustomColor.primaryTextColor.withOpacity(0.7),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),),
                         ],
                       ),
                     ),
                
                
                          ],
                        ),
                
                      ),
                
                
                     
                
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        ),
        
      ),
    );
  }
}