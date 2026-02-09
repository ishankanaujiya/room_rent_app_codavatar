import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:room_rent_app/screen/editProfileScreen.dart';
import 'package:room_rent_app/widget/settingContainer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  IconData iconData = Icons.location_city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0, top: 10.0),
                    // color: Colors.cyan,
                    child: Text(
                      "Setting",
                      style: TextStyle(
                        color: Color(0xFF5C1196).withOpacity(0.6),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Container(
                    width: double.infinity.w,
                    // height: 200.h,
                    // color: Colors.cyan,
                    decoration: BoxDecoration(
                      color: Color(0xFF5C1196).withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100.r),
                          bottomLeft: Radius.circular(100.r)),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage("assets/logInScreenPersonPicture.png"),
                            radius: 90.r,
                          ),
                          decoration: BoxDecoration(
                            //  color: Colors.cyan,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                // color: Colors.black.withOpacity(0.1),
                                color: Color.fromARGB(255, 135, 85, 173).withOpacity(0.2),
                                //  color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(0, 9),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 190.w,
                              // height: 40.h,
                              // color: Colors.cyan,
                              child: Text(
                                "Ishan Kanaujiya",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "+977-9861351391",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 7.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  width: 115.w,
                                  // color: Colors.cyan,
                                  child: Text(
                                    "ishankanaujiya96@gmail.com",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 7.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          
                  SizedBox(
                  height: 10.h,
                ),
                      
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    padding: EdgeInsets.only(top: 20.0),
                    width: double.infinity.w,
                    // height: 200.h,
                    // color: Colors.cyan,
                    child: Column(
                      children: <Widget>[
                        SettingContainer(
                          iconData: Icons.edit,
                          textLabel: "Edit Profile",
                          navigationWidget: EditProfileSreen(),
                        ),
                       
                         
                          SizedBox(
                        height: 10.h,
                      ),
                        SettingContainer(
                          iconData: Icons.post_add,
                          textLabel: "Posts",
                        ),
                         
                         
                          SizedBox(
                        height: 10.h,
                      ),
                        SettingContainer(
                          iconData: Icons.support_agent,
                          textLabel: "Customer Service & Support",
                        ),
                         
                         
                          SizedBox(
                        height: 10.h,
                      ),
                  
                       SettingContainer(
                          iconData: Icons.info_outline,
                          textLabel: "About Us",
                        ),
                         
                         
                          SizedBox(
                        height: 10.h,
                      ),
                  
                      
                      InkWell(
                        onTap: ()
                        {
                          print("Pressed");
                        },
                        
                        child: Container(
                            padding: EdgeInsets.only(right: 15.0),
                            width: double.infinity.w,
                            height: 60.h,
                          //  color: Colors.cyan,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                 
                                  // width: 200.h,
                                  height: double.infinity.h,
                                  // color: Colors.black,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(
                                        Icons.verified_user_outlined,
                                        color: Color(0xFF5C1196).withOpacity(0.6),
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text(
                                        "Version",
                                        style: TextStyle(
                                          // color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                    "1.0.0.0",
                                    style: TextStyle(
                                      color: Colors.grey.withOpacity(0.5),
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                        
                              
                              ],
                            ),
                          ),
                      ),
                  
                         
                          SizedBox(
                        height: 10.h,
                      ),
                  
                      InkWell(
                        onTap: ()
                        {
                          print("Pressed");
                        },
                        child: Container(
                            padding: EdgeInsets.only(right: 15.0),
                            width: double.infinity.w,
                            height: 60.h,
                          //  color: Colors.cyan,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                 
                                  // width: 200.h,
                                  height: double.infinity.h,
                                  // color: Colors.black,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(
                                        Icons.logout,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text(
                                        "Logout",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
        ));
  }
}
