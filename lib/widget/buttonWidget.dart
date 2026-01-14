import 'package:flutter/material.dart';
import 'package:room_rent_app/util/customColor.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}