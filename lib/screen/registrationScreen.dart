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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity.w,
                height: 230.h,
                // color: Colors.cyan,
                child: Stack(
                  // alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: double.infinity.w,
                      height: 145.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFAC8AE9),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          // bottomRight: Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFB794F4).withOpacity(0.7),
                            blurRadius: 15,
                            spreadRadius: 6,
                            offset: Offset(5, 0),

                          )
                        ]
                      ),
                    ),

                    Positioned(
                      left: 117,
                      bottom: 0,
                      child: Container(
                        width: 150.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFF7F7F7).withOpacity(0.4),
                              blurRadius: 30,
                              spreadRadius: 10,
                              // offset: Offset(5, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person,
                          size: 90.0,
                          color: CustomColor.primaryTextColor.withOpacity(0.2),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Welcome To",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Room Khoj,",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                    // Positioned(
                    //   left: 55,
                    //   top: 150,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(5.0),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: <Widget>[
                    //
                    //         Text(
                    //           "Create",
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 13.sp,
                    //             letterSpacing: 1,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    //
                    // Positioned(
                    //   right: 40,
                    //   top: 150,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(5.0),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: <Widget>[
                    //
                    //         Text(
                    //           "Account",
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             letterSpacing: 1,
                    //             fontSize: 13.sp,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(

                height: 15.0.h,
              ),
              SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            // vertical: 10.0,
                            horizontal: 50.0
                          ),
                          width: double.infinity.w,
                          // height: 170,
                          // color: Colors.cyan,
                          // color: CustomColor.mainBodyColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Create Account,", style: TextStyle(
                                color: CustomColor.borderDividerColor,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                              ),),

                              SizedBox(

                                height: 10.0.h,
                              ),


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

                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.borderDividerColor,
                                      width: 1.w,
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

                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.borderDividerColor,
                                      width: 1.w,
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

                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.borderDividerColor,
                                      width: 1.w,
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

                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.borderDividerColor,
                                      width: 1.w,
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

                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomColor.borderDividerColor,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                              ),
                               SizedBox(height: 30.0.h),

                               // InkWell(
                               //  onTap: ()
                               //  {
                               //    if(_formKey.currentState!.validate())
                               //    {
                               //      print("Value Stored");
                               //    }
                               //
                               //  },
                               //   child: Container(
                               //    width: 200.w,
                               //    height: 50.h,
                               //    decoration: BoxDecoration(
                               //      color: Color(0xFFAC8AE9),
                               //      borderRadius: BorderRadius.circular(15.r),
                               //    ),
                               //    child: Center(child: Text("Sign Up", style: TextStyle(
                               //      color: Colors.white,
                               //      fontWeight: FontWeight.bold,
                               //    ),)),
                               //
                               //   ),
                               // ),



                            ],
                          ),
                        ),
                      ),
                    ),

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
                          color: Color(0xFFAC8AE9),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Center(child: Text("Sign Up", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),)),

                      ),
                    ),
                    SizedBox(height: 20.0.h),

                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?", style: TextStyle(
                      fontSize: 11.sp,
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
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9547BF),
                      ),),
                    ),



                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
