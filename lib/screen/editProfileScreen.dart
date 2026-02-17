import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:room_rent_app/provider/sharedPreferenceForUserDetailProvider.dart';
import 'package:room_rent_app/screen/settingScreen.dart';
import 'package:room_rent_app/service/deletePictureFromCloudinary.dart';
import 'package:room_rent_app/service/firebaseService.dart';
import 'package:room_rent_app/service/pictureToCloudinary.dart';
import 'package:room_rent_app/util/keyForSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool isProfileUpdatedLoading = false;

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

   String userFullName = "";
   String userEmail = "";
   String userPhoneNumber = "";
   String userProfileSecureUrl = "";

   String publicIdForUserProfilePicture = "";

   var selectPicture = new ImagePicker();

  File? convertedPicture;

  String initialUserProfilePicture = "";

  changeLoadingStatus(bool loadingStatus) {
    setState(() {
      isLoading = loadingStatus;
    });
  }

  getLoggedInUserDetail() async
  {
    var pref = await SharedPreferences.getInstance();
    userFullName = await pref.getString(KeyForSharedPreference.KEYFORFULLNAME) ?? ""; 
    userEmail = await pref.getString(KeyForSharedPreference.KEYFOREMAIL) ?? ""; 
    userPhoneNumber = await pref.getString(KeyForSharedPreference.KEYFORPHONENUMBER) ?? ""; 
    userProfileSecureUrl = await pref.getString(KeyForSharedPreference.KEYFORPROFILESECUREURL) ?? "";
    // print(userProfileSecureUrl);

    publicIdForUserProfilePicture = await FirebaseService().getPublicIdFromSecureUrl(userProfileSecureUrl);

    fullNameController.text = userFullName;
    phoneNumberController.text = userPhoneNumber;

    setState(() {
      initialUserProfilePicture = userProfileSecureUrl;
    });

  }



@override
void initState() {
  getLoggedInUserDetail();
  super.initState();
  
}


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
                          backgroundImage: initialUserProfilePicture != "" ? NetworkImage(initialUserProfilePicture!): null,
                          radius: 90.r,
                          child: initialUserProfilePicture == "" ? Icon(Icons.person, size: 30,) : null,
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
                            onPressed: () async
                            {
                              XFile? pickedPicture = await selectPicture.pickImage(source: ImageSource.gallery);

                              if(pickedPicture != null)
                                {
                                  isProfileUpdatedLoading = true;
                                  setState(() {
                                    
                                  });
                                  convertedPicture = File(pickedPicture.path);
                                  String updatedSecureUrl = await PictureToCloudinary().uploadPictureToCloudinary(convertedPicture);
                                  if(updatedSecureUrl.isNotEmpty)
                                    {
                                      String storedProfilePicture = userProfileSecureUrl;
                                      await FirebaseService().updateProfilePicture(userEmail, updatedSecureUrl);

                                      var pref = await SharedPreferences.getInstance();
                                      await pref.setString(KeyForSharedPreference.KEYFORPROFILESECUREURL, updatedSecureUrl);


                                      DeletePictureFromCloudinary().deletePictureFromCloudinary(storedProfilePicture);

                                       Fluttertoast.showToast(
                                        msg: "Profile Updated Successfully",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Color(0xFF5C1196).withOpacity(0.6),
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                        );


                                      initialUserProfilePicture = updatedSecureUrl;
                                      isProfileUpdatedLoading = false;
                                      setState(() {

                                      });


                                    }
                                }
                              else
                                {
                                  print("Profile Picture Not Updated");
                                }

                            },
                            icon: isProfileUpdatedLoading ? SizedBox(
                              width: 25.w,
                              height: 30.h,
                              child: CircularProgressIndicator(),
                              ) : Icon(Icons.edit),
                            color: Color(0xFF5C1196).withOpacity(0.6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<SharedPreferenceForUserDetailProvider>(
                  builder: (context, sharedPreferenceValue, _)
                  {
                    return Container(
                    margin: EdgeInsets.only(top: 5.0),
                    width: double.infinity.w,
                    // height: 20.h,
                    // color: Colors.black,
                    child: Center(
                      child: Text(
                        userFullName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                  },
                  
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


                               InkWell(
                                splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                                onTap: () async {
                                   if (_formKey.currentState!.validate()) 
                                   {

                                     changeLoadingStatus(true);
      
                                     Map<String, dynamic> updatedUserDetail = {
                                      "Full Name" : fullNameController.text,
                                      "Phone Number" : phoneNumberController.text,
                                     };
                                     
                                      await FirebaseService().updateUsersDetail(updatedUserDetail, userEmail);
      
                                      await SharedPreferenceForUserDetailProvider().storeUserDetail(fullNameController.text, userEmail, phoneNumberController.text, initialUserProfilePicture);
      
                                      await Future.delayed(Duration(seconds: 2));

                                        Fluttertoast.showToast(
                                        msg: "Details Edited Successfully",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Color(0xFF5C1196).withOpacity(0.6),
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                        );
                                                            
                                      changeLoadingStatus(false);

                                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingScreen()
                    ));
                                   }
                                 
                                },
                                child: isLoading
                                    ? SizedBox(
                                        width: 20.w,
                                        height: 25.h,
                                        child: CircularProgressIndicator(
                                          color: Color(0xFF0F766E),
                                        ))
                                    : Text(
                                       "Save",
                                        style: TextStyle(
                                          color: Color(0xFF0F766E),
                                          fontWeight: FontWeight.bold,
                                        ),
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
      ),
    );
  }
}
