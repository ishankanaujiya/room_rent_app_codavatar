import 'package:flutter/material.dart';
import 'package:room_rent_app/util/customColor.dart';

class TextFieldWidget extends StatelessWidget {

  final bool passwordVisibility;
  final bool emailTextField;
  const TextFieldWidget({super.key, this.passwordVisibility = false, this.emailTextField = true});

  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: TextFormField(
        obscureText: passwordVisibility,
        decoration: InputDecoration(
          hint: emailTextField ? Text("Email", style: TextStyle(
            color: CustomColor.borderDividerColor.withOpacity(0.7),
          ),)
          :
          Text("Password", style: TextStyle(
            color: CustomColor.borderDividerColor.withOpacity(0.7),
          ),),
      
      
          prefixIcon: emailTextField ? Icon(Icons.email, color: CustomColor.borderDividerColor.withOpacity(0.7), size: 19,) :Icon(Icons.password, color: CustomColor.borderDividerColor.withOpacity(0.7), size: 19,),
         
        
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
    );

    
  }
}