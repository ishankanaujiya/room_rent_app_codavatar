import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(child: Column(
          children: <Widget>[
            Container(
              width: double.infinity.w,
              // height: 100.h,
              // color: Colors.cyan,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                         color: Color(0xFF5C1196).withOpacity(0.6),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.cyan,
                      radius: 70.r
                    ),
                  ),

                  SizedBox(
                    width: 5.w,
                  ),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 190.w,
                        // color: Colors.cyan,
                        child: Text("Ishan Kanaujiya",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),),
                      ),
                      Container(
                        width: 190.w,
                        // color: Colors.cyan,
                        child: Text("Ishan Kanaujiya",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),),
                      ),
                    ],
                  ),
                
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20.0, left: 15.0),
              width: double.infinity.w,
              // height: 100.h,
              // color: Colors.cyan,
              child: Text("Posted Rooms",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),),
            ),

            Expanded(
              child: Container(
                width: double.infinity.w,
                color: Colors.cyan,
              ),
            )

          ],
        ),
        ),
      ),
    );
  }
}