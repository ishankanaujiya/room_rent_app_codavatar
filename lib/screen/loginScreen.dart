import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:room_rent_app/provider/circularLoadingProvider.dart';
import 'package:room_rent_app/provider/sharedPreferenceForUserDetailProvider.dart';
import 'package:room_rent_app/screen/home.dart';
import 'package:room_rent_app/screen/homeScreen.dart';
import 'package:room_rent_app/screen/registrationScreen.dart';
import 'package:room_rent_app/service/firebaseAuth.dart';
import 'package:room_rent_app/service/firebaseService.dart';
import 'package:room_rent_app/util/customColor.dart';
import 'package:room_rent_app/widget/buttonWidget.dart';

class LoginInScreen extends StatefulWidget {
  const LoginInScreen({super.key});

  @override
  State<LoginInScreen> createState() => _LoginInScreenState();
}

class _LoginInScreenState extends State<LoginInScreen> {
  @override
  Widget build(BuildContext context) {

    final emailController = new TextEditingController();
    final passwordController = new TextEditingController();


    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 248, 255),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                width: double.infinity.w,
          
                decoration: BoxDecoration(
                  color: Color(0xFFAC8AE9),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200.r)),
                  boxShadow: [
                    BoxShadow(
                     color: Color(0xFFB794F4).withOpacity(0.7),
                     blurRadius: 15,
                     spreadRadius: 6,
                     
                    )
                  ]
                ),
              
                child: Container(
                  width: double.infinity.w,
                  height: 300.h,
                  // color: Colors.cyan,
                  child: Image.asset("assets/logInScreenPersonPicture.png"),
                ),
              ),
          
              SizedBox(
              
                height: 30.0.h,
              ),
          
          
              Text("Welcome To Room Khoj", style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: CustomColor.primaryTextColor.withOpacity(0.4),
                letterSpacing: 1.0,
              ),),
          
              SizedBox(

                height: 5.0.h,
              ),

          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Sign", style: TextStyle(
                    fontSize: 33.sp,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.primaryTextColor.withOpacity(0.9),
                  ),),
          
                  Text("In", style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9547BF),
                  ),),
                ],
              ),
          

              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    // color: Colors.cyan,
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                    width: double.infinity.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
              
                        TextFormField(
                          controller: emailController,
                          validator: (value)
                          {
                            if(value == "" || value == null)
                            {
                              return "Email Field is Required";
                            }
                            if(!value.contains('@gmail.com'))
                            {
                              return "Enter Valid Email";
                            }
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: CustomColor.borderDividerColor.withOpacity(0.7),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                        
                        
                            prefixIcon: Icon(Icons.email, color: CustomColor.borderDividerColor.withOpacity(0.7), size: 19,),
                          
                          
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

                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF5C1196),
                                width: 2.w,
                              ),
                            ),
                          ),
                        
                        ),

                      SizedBox(
                        
                          height: 20.0.h,
                        ),

                        TextFormField(
                          controller: passwordController,
                          validator: (value)
                          {
                            if(value == "" || value == null)
                            {
                              return "Password Field is Required";
                            }
                            if(value.length <8)
                            {
                              return "Password must be of atleast 8 characters";
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: CustomColor.borderDividerColor.withOpacity(0.7),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            // hint: Text("Password", style: TextStyle(
                            //   color: CustomColor.borderDividerColor.withOpacity(0.7),
                            // ),),

                        
                            prefixIcon: Icon(Icons.password, color: CustomColor.borderDividerColor.withOpacity(0.7), size: 20,),
                          
                          
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

                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF5C1196),
                                width: 2.w,
                              ),
                          ),
                          ),
                        ),
                  
                      ],
                    )),
                ),
              ),
              SizedBox(
                height: 20.0.h,
              ),
            

            Consumer<CircularLoadingProvider>(builder: (context, circularLoading, _)
            {
              return InkWell(
            onTap: () async
            {
              Provider.of<CircularLoadingProvider>(context, listen: false).changeLoadingStatus(true);
              if(_formKey.currentState!.validate())
              {
                try{
                  UserCredential user = await FirebaseAuthentication().userSignIn(emailController.text, passwordController.text);
                  QuerySnapshot signedInUserDetail = await FirebaseService().getSignedInUserDetail(emailController.text);
                  DocumentSnapshot documentSnapshot = signedInUserDetail.docs.first;
                  
                  print("The Value are");

                  print(documentSnapshot['PhoneNumber']);
                  print(documentSnapshot['Email']);
                  print(documentSnapshot['FullName']);

                  print("Shared Preferences To Store Value");
              

                  await SharedPreferenceForUserDetailProvider().storeUserDetail(documentSnapshot['FullName'], documentSnapshot['Email'], documentSnapshot['PhoneNumber'], documentSnapshot['SecureUrl']);

                  Fluttertoast.showToast(
                  msg: "Logged In Successfully",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(0xFF5C1196).withOpacity(0.6),
                  textColor: Colors.white,
                  fontSize: 16.0
                  );


                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()
                    ));
                  // await SharedPreferenceForUserDetailProvider().getStoredUserDetail();

                //   final sharedPreference = Provider.of<SharedPreferenceForUserDetailProvider>(context, listen: false);

                //   try  
                //   {
                //      await sharedPreference.storeUserDetail(documentSnapshot['FullName'], documentSnapshot['Email'], documentSnapshot['PhoneNumber']);
                //   }
                //  catch(e)
                //  {
                //   print("This is Login In Error: ${e.toString()}");
                //  }
              //      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()
              // ));

                }
                catch(e)
                {
                  await Future.delayed(Duration(seconds: 1));
                  Fluttertoast.showToast(
                  msg: "Wrong Credientals",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(0xFF5C1196).withOpacity(0.6),
                  textColor: Colors.white,
                  fontSize: 16.0
                  );
                  
                  print("This is Catch Error: ${e.toString()}");
                }
                finally
                {
                  Provider.of<CircularLoadingProvider>(context, listen: false).changeLoadingStatus(false);
                  print("This is the finally block which is called before the navigator");
                }
               

              }
              else
              {
                // await Future.delayed(Duration(seconds: 2));
                 Provider.of<CircularLoadingProvider>(context, listen: false).changeLoadingStatus(false);
              }
              
            },
            child: Container(
              width: 200.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Color(0xFFAC8AE9),
                borderRadius: BorderRadius.circular(10.r),
            
              ),
              child: Center(
                child: Provider.of<CircularLoadingProvider>(context, listen: true).isLoading ? CircularProgressIndicator(
                  // backgroundColor: Colors.white,
                  color: Colors.white,
                ) : Text("Sign In", style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
          );
            }
            ),
           
          
              SizedBox(
                    height: 40.0.h,
                  ),
                  
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?", style: TextStyle(
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
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationScreen()
                        ));
                    },
                    child: Text("Sign Up", style: TextStyle(
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