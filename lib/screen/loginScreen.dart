import 'package:flutter/material.dart';
import 'package:room_rent_app/screen/registrationScreen.dart';
import 'package:room_rent_app/util/customColor.dart';
import 'package:room_rent_app/widget/buttonWidget.dart';
import 'package:room_rent_app/widget/textFieldWidget.dart';

class LoginInScreen extends StatelessWidget {
  const LoginInScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  width: double.infinity,
                  height: 160,
                  // color: Colors.cyan,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextFieldWidget(passwordVisibility: false, emailTextField: true,),
                      TextFieldWidget(passwordVisibility: true, emailTextField: false,),
                    ],
                  )),
              ),
              SizedBox(
                height: 20.0,
              ),
            
              ButtonWidget(),
          
              SizedBox(
                    height: 40.0,
                  ),
                  
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?", style: TextStyle(
                    fontSize: 10,
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
                      fontSize: 10,
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