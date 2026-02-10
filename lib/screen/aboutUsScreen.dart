import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:room_rent_app/screen/settingScreen.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // block default back
      onPopInvoked: (didPop) {
        if (didPop) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => SettingScreen()),
        );
      },
      child: Scaffold(
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



                    Positioned(
                      right: 50,
                      bottom: 50,
                      child: Container(
                        width: 30.w,
                        height: 30.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),
                    Positioned(
                      right: 25,
                      bottom: 30,
                      child: Container(
                        width: 25.w,
                        height: 25.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 15,
                      child: Container(
                        width: 15.w,
                        height: 15.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFFF8A39).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),

                    Positioned(
                      right: 100,
                      bottom: 50,
                      child: Container(
                        width: 30.w,
                        height: 30.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),
                    Positioned(
                      right: 130,
                      bottom: 30,
                      child: Container(
                        width: 25.w,
                        height: 25.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),
                    Positioned(
                      right: 156,
                      bottom: 15,
                      child: Container(
                        width: 15.w,
                        height: 15.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFFF8A39).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),

                    Positioned(
                      right: 72,
                      bottom: 80,
                      child: Container(
                        width: 35.w,
                        height: 35.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFFF8A39).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),

                    Positioned(
                      right: 50,
                      top: 50,
                      child: Container(
                        width: 30.w,
                        height: 30.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),
                    Positioned(
                      right: 25,
                      top: 30,
                      child: Container(
                        width: 25.w,
                        height: 25.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 15,
                      child: Container(
                        width: 15.w,
                        height: 15.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFFF8A39).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),

                    Positioned(
                      right: 100,
                      top: 50,
                      child: Container(
                        width: 30.w,
                        height: 30.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),
                    Positioned(
                      right: 130,
                      top: 30,
                      child: Container(
                        width: 25.w,
                        height: 25.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),
                    Positioned(
                      right: 156,
                      top: 15,
                      child: Container(
                        width: 15.w,
                        height: 15.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFFF8A39).withOpacity(0.1),
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),

                    Positioned(
                      right: 72,
                      top: 80,
                      child: Container(
                        width: 35.w,
                        height: 35.h,

                        decoration: BoxDecoration(
                          color: Color(0xFFFF8A39).withOpacity(0.1),
                          shape: BoxShape.circle,

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
      ),
    );
  }
}
