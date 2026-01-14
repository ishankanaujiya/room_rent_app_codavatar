import 'package:flutter/material.dart';
import 'package:room_rent_app/screen/homeScreen.dart';
import 'package:room_rent_app/screen/registrationScreen.dart';
import 'package:room_rent_app/util/customColor.dart';
import 'package:room_rent_app/widget/buttonWidget.dart';
import 'package:room_rent_app/widget/textFieldWidget.dart';

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
                width: double.infinity,
          
                decoration: BoxDecoration(
                  color: Color(0xFFB794F4),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200)),
                  boxShadow: [
                    BoxShadow(
                     color: Color(0xFFB794F4).withOpacity(0.7),
                     blurRadius: 10,
                     spreadRadius: 6,
                     
                    )
                  ]
                ),
              
                child: Container(
                  width: double.infinity,
                  height: 300,
                  // color: Colors.cyan,
                  child: Image(image: AssetImage("logInScreenPersonPicture.png"),fit: BoxFit.contain,),
                ),
              ),
          
              SizedBox(
              
                height: 40.0,
              ),
          
          
              Text("Welcome To Room Khoj", style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.grey.withOpacity(0.5),
                letterSpacing: 2.0,
              ),),
          
              SizedBox(
              
                height: 10.0,
              ),
          
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Sign", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.primaryTextColor.withOpacity(0.9),
                  ),),
          
                  Text("In", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9547BF),
                  ),),
                ],
              ),
          
              SizedBox(
              
                height: 20.0,
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                    width: double.infinity,
                    // height: 170,
                    // color: Colors.cyan,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
              
                        TextFormField(
                          validator: (value)
                          {
                            if(value == "" || value == null)
                            {
                              return "Enter the field";
                            }
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            hint: Text("Email", style: TextStyle(
                              color: CustomColor.borderDividerColor.withOpacity(0.7),
                            ),),
                        
                        
                            prefixIcon: Icon(Icons.email, color: CustomColor.borderDividerColor.withOpacity(0.7), size: 19,),
                          
                          
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: CustomColor.borderDividerColor,
                              width: 1,
                            ),
                            ),
                        
                            disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: CustomColor.borderDividerColor,
                              width: 1,
                            ),
                            ),
                        
                            focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: CustomColor.borderDividerColor,
                              width: 2,
                            ),
                            ),
                          ),
                        
                        ),

                      SizedBox(
                        
                          height: 40.0,
                        ),

                        TextFormField(
                          validator: (value)
                          {
                            if(value == "" || value == null)
                            {
                              return "Enter the field";
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hint: Text("Password", style: TextStyle(
                              color: CustomColor.borderDividerColor.withOpacity(0.7),
                            ),),
                        
                        
                            prefixIcon: Icon(Icons.password, color: CustomColor.borderDividerColor.withOpacity(0.7), size: 19,),
                          
                          
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: CustomColor.borderDividerColor,
                              width: 1,
                            ),
                            ),
                        
                            disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: CustomColor.borderDividerColor,
                              width: 1,
                            ),
                            ),
                        
                            focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: CustomColor.borderDividerColor,
                              width: 2,
                            ),
                            ),
                          ),
                        ),
                  
                      ],
                    )),
                ),
              ),
              SizedBox(
                height: 20.0,
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
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: CustomColor.borderDividerColor,
                borderRadius: BorderRadius.circular(10),
            
              ),
              child: Center(
                child: Text("Sign In", style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),),
              ),
            ),
          ),
          
              SizedBox(
                    height: 40.0,
                  ),
                  
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?", style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.primaryTextColor.withOpacity(0.9),
                  ),),

                
                SizedBox(
                  width: 10.0,
                ),
                  
          
                  InkWell(
                    onTap: ()
                    {
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationScreen()
                        ));
                    },
                    child: Text("Sign Up", style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9547BF),
                    ),),
                  ),
                  
                  
          
                ],
              )
          
            ],
          ),
        ),
      ),
    );
  }
}