import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayRoomDetail extends StatefulWidget {
  const DisplayRoomDetail({super.key});

  @override
  State<DisplayRoomDetail> createState() => _DisplayRoomDetailState();
}

class _DisplayRoomDetailState extends State<DisplayRoomDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 100.h,
              color: Colors.cyan,
              
            ),

            
          ],
        )),
      ),
    );
  }
}