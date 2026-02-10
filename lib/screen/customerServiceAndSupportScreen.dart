import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerServiceAndSupportScreen extends StatefulWidget {
  const CustomerServiceAndSupportScreen({super.key});

  @override
  State<CustomerServiceAndSupportScreen> createState() => _CustomerServiceAndSupportScreenState();
}

class _CustomerServiceAndSupportScreenState extends State<CustomerServiceAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity.w,
              height: 350.h,
              decoration: BoxDecoration(
                color: Color(0xFFAC8AE9).withOpacity(0.5),  
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(300.r)),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      // width: 100.w,
                      // color: Colors.cyan,
                      child: Row(
                        children: <Widget>[
                          Text("Customer Service",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                          ),),
                      
                          SizedBox(
                            width: 5.w,
                          ),
                      
                          Text("& Support",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:19.sp,
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),
                    ),

                    Container(
                       width: double.infinity.w,
                       height: 250,
                      //  color: Colors.cyan,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 35.0),
                              width: 250.w,
                              height: 300.h,
                              // color: Colors.cyan,
                              child: Image(
                                image: AssetImage("assets/customerServiceAndSupport.png"), fit: BoxFit.cover,
                                ),
                                ),
                          ),

                          Positioned(
                            right: 0,
                            child: Container(
                              width: 35.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                 color: Colors.white,
                                 shape: BoxShape.circle,
                              ),
                            ),
                          ),

                          Positioned(
                            right: 30,
                            top: 25,
                            child: Container(
                              width: 25.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                 color: Colors.white,
                                 shape: BoxShape.circle,
                              ),
                            ),
                          ),

                          Positioned(
                            right: 55,
                            top: 45,
                            child: Container(
                              width: 15.w,
                              height: 15.h,
                              decoration: BoxDecoration(
                                 color: Colors.white,
                                 shape: BoxShape.circle,
                              ),
                            ),
                          ),


                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Container(
                              width: 15.w,
                              height: 15.h,
                              decoration: BoxDecoration(
                                  color: Color(0xFFAC8AE9).withOpacity(0.5),  
                                 shape: BoxShape.circle,
                              ),
                            ),
                          ),

                          Positioned(
                            left: 13,
                            bottom: 13,
                            child: Container(
                              width: 25.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                 color: Color(0xFFAC8AE9).withOpacity(0.5),  
                                 shape: BoxShape.circle,
                              ),
                            ),
                          ),

                          Positioned(
                            left: 33,
                            bottom: 28,
                            child: Container(
                              width: 35.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  color: Color(0xFFAC8AE9).withOpacity(0.5),  
                                 shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20.0),
              width: double.infinity.w,
              height: 150.h,
              // color: Colors.cyan,
              child: Column(
                children: <Widget>[
                   Text("How can we help you?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                    ),),

                    SizedBox(
                      height: 5.h,
                    ),

                    Container(
                      // color: Colors.cyan,
                      width: 310.w,
                      child: Text("Our Team is here to assist you with any questions or concern you may have",
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}