import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:room_rent_app/screen/home.dart';
import 'package:room_rent_app/screen/loginScreen.dart';
import 'package:room_rent_app/screen/welcomeScreen.dart';
import 'package:room_rent_app/util/keyForSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomKhojLoadingScreen extends StatefulWidget {
  const RoomKhojLoadingScreen({super.key});

  @override
  State<RoomKhojLoadingScreen> createState() => _RoomKhojLoadingScreenState();
}

class _RoomKhojLoadingScreenState extends State<RoomKhojLoadingScreen> {
  bool isUp = true;

   String userFullName = "";
  String userEmail = "";
  String userPhoneNumber = "";
  String userProfileSecureUrl = "";


  createDelayForScreenChange() async
  {
    await Future.delayed(Duration(seconds: 6));

     var pref = await SharedPreferences.getInstance();
    userFullName =
        await pref.getString(KeyForSharedPreference.KEYFORFULLNAME) ?? "";
    userEmail = await pref.getString(KeyForSharedPreference.KEYFOREMAIL) ?? "";
    userPhoneNumber =
        await pref.getString(KeyForSharedPreference.KEYFORPHONENUMBER) ?? "";
    userProfileSecureUrl =
        await pref.getString(KeyForSharedPreference.KEYFORPROFILESECUREURL) ??
            "";

            if(userFullName == "")
            {
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );

            }
            else
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()
              ));
            }
  }

  @override
  void initState() {
    createDelayForScreenChange();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity.w,
        // height: 100.h,
        // color: Colors.cyan,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                // color: Colors.cyan,
                child: Stack(
                  children: [



                    Positioned(
                      left: 0,
                      right: -600,
                      bottom: 0,
                      child: Container(
                        width: 500.w,
                        height: 500.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF8A39).withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Positioned(
                      left: -450,
                      right: 0,
                      child: Container(
                        width: 500.w,
                        height: 500.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9).withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 210,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(
                          begin: isUp ? -15 : 0,
                          end: isUp ? 0 : -15,
                        ),
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutSine,

                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, value),
                            child: child,
                          );
                        },
                        onEnd: () {
                          setState(() {
                            isUp = !isUp;     // flip direction each cycle
                          });
                        },
                        child: Container(
                          width: double.infinity.w,
                          height: 230.h,
                          child: Image(
                            image: AssetImage("assets/roomKhoj.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          // color: Colors.cyan,
                          // shape: BoxShape.circle,
                        ),
                        child: CircularProgressIndicator(
                          color: Color(0xFFFF8A39),
                          backgroundColor: Color(0xFF6B3ACD),
                        ),
                      ),
                    ),



                    Positioned(
                      right: -350,
                      top: -350,
                      child: Container(
                        width: 500.w,
                        height: 500.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Positioned(
                      left: -600,
                      right: 0,
                      bottom: -300,
                      child: Container(
                        width: 500.w,
                        height: 500.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9).withOpacity(0.1),
                          shape: BoxShape.circle,
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
    );
  }
}
