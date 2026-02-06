import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfileSreen extends StatefulWidget {
  const EditProfileSreen({super.key});

  @override
  State<EditProfileSreen> createState() => _EditProfileSreenState();
}

class _EditProfileSreenState extends State<EditProfileSreen> {
  static const String fullName = "Ishan Kanaujiya";
  static const String phoneNumebr = "9861351391";

  var fullNameController = new TextEditingController();
  var phoneNumberController = new TextEditingController();

  bool isLoading = false;

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  changeLoadingStatus(bool loadingStatus) {
    setState(() {
      isLoading = loadingStatus;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fullNameController.text = fullName;
    phoneNumberController.text = phoneNumebr;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity.w,
          child: SafeArea(
              child: Column(
            children: <Widget>[
              Container(
                width: double.infinity.w,
                height: 80.h,
                color: Colors.white,
                child: Center(
                    child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20.0),
                width: double.infinity.w,
                // height: 200.h,
                // color: Colors.cyan,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF5C1196).withOpacity(0.6),
                          // width: 2.w,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/person.jpg"),
                        radius: 90.r,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 10,
                      child: Container(
                        // color: Colors.white,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF5C1196).withOpacity(0.6),
                            // width: 2.w,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                          color: Color(0xFF5C1196).withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                width: double.infinity.w,
                // height: 20.h,
                // color: Colors.black,
                child: Center(
                  child: Text(
                    "Ishan Kanaujiya",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  margin: EdgeInsets.only(top: 60.0),
                  width: double.infinity.w,
                  // height: 20.h,
                  // color: Colors.cyan,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        // color: Colors.cyan,
                        padding: EdgeInsets.only(left: 6.0),
                        width: double.infinity.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Editable details",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                 if (_formKey.currentState!.validate()) 
                                 {
                                   changeLoadingStatus(true);
                                    await Future.delayed(Duration(seconds: 2));
                                    changeLoadingStatus(false);
                                 }
                               
                              },
                              icon: isLoading
                                  ? SizedBox(
                                      width: 20.w,
                                      height: 20.h,
                                      child: CircularProgressIndicator(
                                        color: Color(0xFF0F766E),
                                      ))
                                  : Icon(
                                      Icons.check,
                                      size: 22,
                                      color: Color(0xFF0F766E),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            // alignment: Alignment.center,
                            // width: 100.w,
                            // height: 20.h,
                            // color: Colors.black,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor:
                                      Color(0xFF5C1196).withOpacity(0.4),
                                  child: Icon(
                                    Icons.person,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Full Name",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 2.0),
                              // width: 170.w,
                              // height: 30.h,
                              // color: Colors.cyan,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  validator: (value) 
                                  {
                                    if (value == "" || value == null)
                                     {
                                     return "Full Name is required";
                                    }
                                      
                                  },
                                  controller: fullNameController,
                                  obscureText: false,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.w,
                                      ),
                                    ),
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.w,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.w,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.w,
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 2.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            // alignment: Alignment.center,
                            // width: 100.w,
                            // height: 20.h,
                            // color: Colors.black,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor:
                                      Color(0xFF5C1196).withOpacity(0.4),
                                  child: Icon(
                                    Icons.phone,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Phone Number",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 2.0),
                              // width: 170.w,
                              // height: 30.h,
                              // color: Colors.cyan,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == "" || value == null) {
                                      return "Phone Number is Required";
                                    }
                                    if (value.length < 10 && value.length > 10) {
                                      return "Phone Number Must be of 10 Digit";
                                    }
                                  },
                                  controller: phoneNumberController,
                                  obscureText: false,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.w,
                                      ),
                                    ),
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.w,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.w,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.w,
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 2.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
