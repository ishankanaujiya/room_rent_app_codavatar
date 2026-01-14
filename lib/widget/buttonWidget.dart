import 'package:flutter/material.dart';
import 'package:room_rent_app/screen/homeScreen.dart';
import 'package:room_rent_app/screen/loginScreen.dart';
import 'package:room_rent_app/util/customColor.dart';
import 'package:room_rent_app/util/forKeyForTextField.dart';

class ButtonWidget extends StatefulWidget {
  final Widget? navigatorWidget;
  const ButtonWidget({super.key, this.navigatorWidget});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        if(formKeyForSignInForm.currentState!.validate())
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
    );
  }
}