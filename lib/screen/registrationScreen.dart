import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:room_rent_app/screen/loginScreen.dart';
import 'package:room_rent_app/util/customColor.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 243, 252),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity.w,
              height: 250.h,
              color: Colors.transparent,
              child: Stack(
                // alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: double.infinity.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: CustomColor.mainBodyColor.withOpacity(0.9),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: CustomColor.mainBodyColor.withOpacity(0.8),
                      //     blurRadius: 10,
                      //     spreadRadius: 6,
                      //     offset: Offset(10, 0),

                      //   )
                      // ]
                    ),
                  ),

                  Center(
                    child: Positioned(
                      // bottom: 10,
                      child: Container(
                        width: 150.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: CustomColor.primaryTextColor.withOpacity(
                                0.1,
                              ),
                              blurRadius: 6,
                              spreadRadius: 4,
                              offset: Offset(5, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person,
                          size: 90.0,
                          color: CustomColor.primaryTextColor.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Welcome To",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Room Khoj,",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    left: 85,
                    top: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Be a part of",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 7.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Room Khoj",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    right: 58,
                    top: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Then",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 7.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Create Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          // vertical: 10.0,
                          horizontal: 80.0
                        ),
                        width: double.infinity.w,
                        // height: 170,
                        // color: Colors.cyan,
                        // color: CustomColor.mainBodyColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextFormField(
                              validator: (value) {
                                if (value == "" || value == null) {
                                  return "Full Name is Required";
                                }
                              
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                // hint: Text(
                                //   "Full Name",
                                //   style: TextStyle(
                                //     color: CustomColor.borderDividerColor
                                //         .withOpacity(0.7),
                                //   ),
                                // ),

                                prefixIcon: Icon(
                                  Icons.person,
                                  color: CustomColor.borderDividerColor
                                      .withOpacity(0.7),
                                  size: 19,
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 1.w,
                                  ),
                                ),

                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 1.w,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 2.w,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20.0.h),

                            TextFormField(
                              validator: (value) {
                                if (value == "" || value == null) {
                                  return "Email is Required";
                                }
                                if (!value.contains("@gmail.com")) {
                                  return "Enter Valid Email Address";
                                }
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                // hint: Text(
                                //   "Email",
                                //   style: TextStyle(
                                //     color: CustomColor.borderDividerColor
                                //         .withOpacity(0.7),
                                //   ),
                                // ),

                                prefixIcon: Icon(
                                  Icons.email,
                                  color: CustomColor.borderDividerColor
                                      .withOpacity(0.7),
                                  size: 19,
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 1.w,
                                  ),
                                ),

                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 1.w,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 2.w,
                                  ),
                                ),
                              ),
                            ),

                             SizedBox(height: 20.0.h),

                            TextFormField(
                              validator: (value) {
                                if (value == "" || value == null) {
                                  return "Phone Number is Required";
                                }
                                if (value.length < 10 && value.length > 10) {
                                  return "Phone Number Must be of 10 Digit";
                                }
                              },
                              obscureText: false,
                              keyboardType: TextInputType.number ,
                              decoration: InputDecoration(
                                // hint: Text(
                                //   "Phone Number",
                                //   style: TextStyle(
                                //     color: CustomColor.borderDividerColor
                                //         .withOpacity(0.7),
                                //   ),
                                // ),

                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: CustomColor.borderDividerColor
                                      .withOpacity(0.7),
                                  size: 19,
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 1.w,
                                  ),
                                ),

                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 1.w,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 2.w,
                                  ),
                                ),
                              ),
                            ),

                             SizedBox(height: 20.0.h),

                            TextFormField(
                              validator: (value) {
                                if (value == "" || value == null) {
                                  return "Password Field is Required";
                                }
                                if (value.length < 8 || value.length > 15) {
                                  return "Password must be of between 8 - 15 characters";
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                // hint: Text(
                                //   "Password",
                                //   style: TextStyle(
                                //     color: CustomColor.borderDividerColor
                                //         .withOpacity(0.7),
                                //   ),
                                // ),

                                prefixIcon: Icon(
                                  Icons.password,
                                  color: CustomColor.borderDividerColor
                                      .withOpacity(0.7),
                                  size: 19,
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 1.w,
                                  ),
                                ),

                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 1.w,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 2.w,
                                  ),
                                ),
                              ),
                            ),

                             SizedBox(height: 20.0.h),

                            TextFormField(
                              validator: (value) {
                                 if (value == "" || value == null) {
                                  return "Password Field is Required";
                                }
                                if (value.length < 8 || value.length > 15) {
                                  return "Password must be of between 8 - 15 characters";
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                // hint: Text(
                                //   "Confirm Password",
                                //   style: TextStyle(
                                //     color: CustomColor.borderDividerColor
                                //         .withOpacity(0.7),
                                //   ),
                                // ),

                                prefixIcon: Icon(
                                  Icons.password,
                                  color: CustomColor.borderDividerColor
                                      .withOpacity(0.7),
                                  size: 19,
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 1.w,
                                  ),
                                ),

                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 1.w,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColor.borderDividerColor,
                                    width: 2.w,
                                  ),
                                ),
                              ),
                            ),
                             SizedBox(height: 30.0.h),

                             InkWell(
                              onTap: ()
                              {
                                if(_formKey.currentState!.validate())
                                {
                                  print("Value Stored");
                                }
                                
                              },
                               child: Container(
                                width: 200.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: CustomColor.mainBodyColor.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Center(child: Text("Sign Up", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),)),
                                                     
                               ),
                             ),
                        

  
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0.h),

                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?", style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.primaryTextColor.withOpacity(0.9),
                  ),),

                
                SizedBox(
                  width: 10.0.w,
                ),
                  
          
                  InkWell(
                    onTap: ()
                    {
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginInScreen()
                        ));
                    },
                    child: Text("Sign In", style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9547BF),
                    ),),
                  ),
                  
                  
          
                ],
              ),
          ],
        ),
      ),
    );
  }
}
