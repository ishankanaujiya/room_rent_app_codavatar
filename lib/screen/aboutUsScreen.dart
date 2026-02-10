import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
              // color: Colors.black,
              child: Stack(
                children: [
                  Positioned(
                    top: -10,
                    left: -170,
                    child: Container(
                      width: 350.w,
                      height: 350.h,
                      decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9).withOpacity(0.2),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFAC8AE9).withOpacity(0.2),
                                blurRadius: 6,
                                spreadRadius: 3,
                                offset: Offset(1, 4))
                          ]),
                    ),
                  ),
                  Positioned(
                    top: 95,
                    left: -30,
                    child: Container(
                      width: 240.w,
                      // color: Colors.white,
                      child: Image(image: AssetImage("assets/roomKhoj.png")),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 160,
                    child: Container(
                      // color: Colors.cyan,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 80.w,
                            // color: Colors.cyan,
                            child: Text(
                              "About",
                              style: TextStyle(
                                color: Color(0xFF6B3ACD),
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: 35.w,
                            // color: Colors.black,
                            child: Text(
                              "Us",
                              style: TextStyle(
                                color: Color(0xFFFF8A39),
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  margin: EdgeInsets.only(top: 25.0),
                  width: double.infinity.w,
                  // height: 100.h,
                  // color: Colors.cyan,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Welcome to",
                            style: TextStyle(
                              color: Color(0xFF6B3ACD),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Room",
                            style: TextStyle(
                              color: Color(0xFF6B3ACD),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Khoj",
                            style: TextStyle(
                              color: Color(0xFFFF8A39),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Room Khoj is a simple and smart platform designed to connect room seekers with room owners in one place. Finding the right room can be stressful and time-consuming, so we built Room Khoj to make the process fast, transparent, and hassle-free.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.justify,
                            ),

                            SizedBox(
                              height: 20.h,
                            ),

                            Text(
                              "Our app allows users to post available rooms with full details and also lets seekers browse through listed rooms to find a place that fits their needs and budget. Once a user finds a suitable room, they can directly contact the uploader and take the conversation forward.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.justify,
                            ),

                            SizedBox(
                              height: 20.h,
                            ),



                            RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                text: '"Your next home is waiting ',
                                style: TextStyle(
                                  color: Colors.black,
                                  // color: Color(0xFF6B3ACD),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: '- explore it with', style: TextStyle(
                                      // color: Color(0xFFFF8A39),
                                      // fontWeight: FontWeight.bold,
                                  ),
                                  ),

                                  TextSpan(text: ' Room ', style: TextStyle(
                                    color: Color(0xFF6B3ACD),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),

                                  TextSpan(text: ' Khoj."', style: TextStyle(
                                    color: Color(0xFFFF8A39),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),

                                ],
                              ),
                            )



                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
