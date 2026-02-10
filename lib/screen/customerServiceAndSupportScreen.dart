import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:room_rent_app/screen/settingScreen.dart';

class CustomerServiceAndSupportScreen extends StatefulWidget {
  const CustomerServiceAndSupportScreen({super.key});

  @override
  State<CustomerServiceAndSupportScreen> createState() =>
      _CustomerServiceAndSupportScreenState();
}

class _CustomerServiceAndSupportScreenState
    extends State<CustomerServiceAndSupportScreen> {
  bool isEmailEnabled = false;
  bool isPhoneEnabled = false;
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
          // color: Colors.cyan,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity.w,
                height: 350.h,
                decoration: BoxDecoration(
                  color: Color(0xFFAC8AE9).withOpacity(0.5),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(300.r)),
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
                            Text(
                              "Customer Service",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "& Support",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity.w,
                        height: 270.h,
                        // color: Colors.cyan,
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 35.0),
                                width: 220.w,
                                height: 300.h,
                                // color: Colors.cyan,
                                child: Image(
                                  image: AssetImage(
                                      "assets/customerServiceAndSupport.png"),
                                  fit: BoxFit.cover,
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
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                width: double.infinity.w,
                // height: 100.h,
                // color: Colors.cyan,
                child: Column(
                  children: <Widget>[
                    Text(
                      "How can we help you?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      // color: Colors.cyan,
                      width: 310.w,
                      child: Text(
                        "Our Team is here to assist you with any questions or concern you may have.",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity.w,
                  // color: Colors.cyan,
                  child: Stack(
                    children: [
                      Positioned(
                        left: -100,
                        bottom: -70,
                        child: Container(
                          width: 200.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFAC8AE9).withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        right: -170,
                        top: 0,
                        child: Container(
                          width: 200.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFAC8AE9).withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 30,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            isEmailEnabled = !isEmailEnabled;
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.0),
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            width: double.infinity.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: Color(0xFFAC8AE9).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.email,
                                        color:
                                            Color(0xFFAC8AE9).withOpacity(0.5),
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Email Us",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          isEmailEnabled
                                              ? Text(
                                                  "ishankanaujiya96@gmail.com",
                                                  style: TextStyle(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              : Text(
                                                  "Send us email for any query.",
                                                  style: TextStyle(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                          ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    splashColor: Colors.transparent,
                                    onPressed: () {
                                      isEmailEnabled = !isEmailEnabled;
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.chevron_right_rounded)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 115,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            isPhoneEnabled = !isPhoneEnabled;
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.0),
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            width: double.infinity.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: Color(0xFFAC8AE9).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.phone,
                                        color:
                                            Color(0xFFAC8AE9).withOpacity(0.5),
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Call Us",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          isPhoneEnabled
                                              ? Text(
                                                  "+977-9861351391",
                                                  style: TextStyle(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              : Text(
                                                  "Call us for any query.",
                                                  style: TextStyle(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    splashColor: Colors.transparent,
                                    onPressed: () {
                                      isPhoneEnabled = !isPhoneEnabled;
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.chevron_right_rounded)),
                              ],
                            ),
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
      ),
    );
  }
}
