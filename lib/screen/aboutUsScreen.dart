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
              height: 500.h,
              // color: Colors.black,
              child: Stack(
                children: [
                  Positioned(
                    top: -10,
                    left: -170,
                    child: Container(
                      width: 400.w,
                      height: 400.h,
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
                    top: 87,
                    left: -30,
                    child: Container(
                      width: 250.w,
                      // color: Colors.white,
                      child: Image(image: AssetImage("assets/roomKhoj.png")),
                    ),
                  ),
                  
                  Positioned(
                    right: 5,
                    top: 160,
                    
                    child: Container(
                      // color: Colors.cyan,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 70.w,
                            // color: Colors.cyan,
                            child: Text(
                              "About",
                              style: TextStyle(
                                color: Color(0xFF6B3ACD),
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                             width: 50.w,
                            // color: Colors.black,
                            child: Text(
                              "Us",
                              style: TextStyle(
                                color: Color(0xFFFF8A39),
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
