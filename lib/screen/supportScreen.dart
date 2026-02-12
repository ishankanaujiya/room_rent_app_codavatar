import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:room_rent_app/screen/home.dart';
import 'package:room_rent_app/screen/loginScreen.dart';
import 'package:room_rent_app/screen/welcomeScreen.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // block default back
      onPopInvoked: (didPop) {
        if (didPop) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => WelcomeScreen()),
        );
      },
      child: Scaffold(
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
                    "Access 24/7 Support",
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
      
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                      "Connect directly with dediacted support team for any questions and assisteance.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                                      ),
                    ),
      
                  ],
                ),
              ),
      
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                  width: double.infinity.w,
                  
                  // color: Colors.black,
                  decoration: BoxDecoration(
                    boxShadow: [
                                  BoxShadow(
                                    // color: Colors.black.withOpacity(0.1),
                                    color: Color.fromARGB(255, 208, 185, 250)
                                        .withOpacity(0.4),
                                    //  color: Colors.black.withOpacity(0.1),
                                    blurRadius: 60,
                                    spreadRadius: 1,
                                    // offset: Offset(0, 9),
                                  ),
                                ],
                    shape: BoxShape.circle
                  ),
                  child: Image(image: AssetImage("assets/customerServiceAndSupport.png"), fit: BoxFit.cover,),
                ),
              ),
      
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                width: double.infinity.w,
                height: 100.h,
                // color: Colors.grey,
                 child: Text(
                 "Access 24/7 Support, easy posting of rooms and easy showcase of rooms",
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 11.sp,
                   fontWeight: FontWeight.w400,
                 ),
                 textAlign: TextAlign.center,
                 maxLines: 2,
                                 ),
              ),
      
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity.w,
                height: 80.h,
                // color: Colors.cyan,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: ()
                  {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginInScreen()),
                        );
                  },
                   child: Text("Get Started",
                style: TextStyle(
                   color: Color(0xFF6B3ACD),
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),),
                
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}