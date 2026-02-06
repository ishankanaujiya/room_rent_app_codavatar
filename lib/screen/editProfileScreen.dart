import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileSreen extends StatefulWidget {
  const EditProfileSreen({super.key});

  @override
  State<EditProfileSreen> createState() => _EditProfileSreenState();
}

class _EditProfileSreenState extends State<EditProfileSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
       width: double.infinity.w,
       child: SafeArea(child: Column(
        children: <Widget>[

          Container(
            width: double.infinity.w,
            height: 80.h,
            color: Colors.white,
            child: Center(child: Text("Edit Profile", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),)),
          ),

          
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10.0),
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
                    backgroundImage: AssetImage("assets/person.jpg"),
                    radius: 90.r,
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
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.edit), color: Color(0xFF5C1196).withOpacity(0.6),),
                  ),
                ),
              ],
            ),
          ),

         Container(
          margin: EdgeInsets.only(top: 5.0),
          width: double.infinity.w,
          // height: 20.h,
          // color: Colors.black,
          child: Center(
            child: Text("Ishan Kanaujiya", style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),),
            ),
         )
        ],
       )),
      ),

      
      
    );
  }
}