import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity.w,
        height: double.infinity.h,
        // color: Colors.cyan,
        child: Column(
          children: <Widget>[
            Container(
              width: 200.w,
              // height: 100.h,
              // color: Colors.grey,
              child: SafeArea(child: Container(
                // padding: EdgeInsets.only(top: 10.0),
                // width: 50.w,
                height: 100.h,
                // color: Colors.red,
                child: Image(image: AssetImage("assets/roomKhoj.png"), fit: BoxFit.cover,),
                ),
                ),
            ),

              Container(
              width: double.infinity.w,
              height: 100.h,
              // color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                  "Find Your Dream Room",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 5.h,
                ),

                  Text(
                  "Discover the best room options tailored to your needs.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),

                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity.w,
                
                // color: Colors.black,
                decoration: BoxDecoration(
                  boxShadow: [
                                BoxShadow(
                                  // color: Colors.black.withOpacity(0.1),
                                  color: Color.fromARGB(255, 208, 185, 250)
                                      .withOpacity(0.2),
                                  //  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 40,
                                  spreadRadius: 1,
                                  // offset: Offset(0, 9),
                                ),
                              ],
                  shape: BoxShape.circle
                ),
                child: Image(image: AssetImage("assets/welcomeScreenPicture.png"), fit: BoxFit.cover,),
              ),
            ),

              Container(
              width: double.infinity.w,
              height: 100.h,
              // color: Colors.grey,
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                  "Our Mission",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 5.h,
                ),

                  Text(
                  "To make finding your ideal room easy and hassel-free",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),

                ],
              ),
            ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: double.infinity.w,
              height: 80.h,
              // color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){}, 
                    child: Text("Skip",
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),),
                  ),

                  
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){}, child: Text("Next",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),),
                  
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}