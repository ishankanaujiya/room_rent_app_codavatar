import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:room_rent_app/screen/homeScreen.dart';
import 'package:room_rent_app/screen/registrationScreen.dart';
import 'package:room_rent_app/util/customColor.dart';
import 'package:room_rent_app/widget/buttonWidget.dart';

class LoginInScreen extends StatelessWidget {
  const LoginInScreen({super.key});

  @override
  Widget build(BuildContext context) {

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
            
           InkWell(
            onTap: ()
            {
              if(_formKey.currentState!.validate())
              {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()
              ));

              }
              
            },
            child: Container(
              width: 200.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: Color(0xFFAC8AE9),
                borderRadius: BorderRadius.circular(10),
            
              ),
              child: Center(
                child: Text("Sign In", style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
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