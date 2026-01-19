import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:room_rent_app/util/customColor.dart';

class AddRoomDetail extends StatefulWidget {
  const AddRoomDetail({super.key});

  @override
  State<AddRoomDetail> createState() => _AddRoomDetailState();
}

class _AddRoomDetailState extends State<AddRoomDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 228, 253),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity.w,
           decoration: BoxDecoration(
                      // color: Color.fromARGB(255, 221, 207, 253),
                      //  borderRadius: BorderRadius.only(
                      //         // topRight: Radius.circular(50.r),
                      //         bottomRight: Radius.circular(25.r)
                      //         ),
                        ),
                  
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                      // color: Color.fromARGB(255, 221, 207, 253),
                      color: Color.fromARGB(255, 234, 227, 252),
                      ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80.w,
                        height: double.infinity.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFAC8AE9),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.r),
                              bottomRight: Radius.circular(50.r)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFAC8AE9).withOpacity(0.6),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(4, 2),

                                )
                              ]
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_left_outlined),
                            color: Color.fromARGB(255, 237, 231, 252),
                            iconSize: 30.0,
                            splashColor: Colors.transparent),
                      ),

                      SizedBox(
                        width: 50.0.w,
                      ),
                    
                      Text("Add Room Detail", style: TextStyle(
                         color: Color(0xFFAC8AE9),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity.w,
                  height: 200.h,
                  // color: Colors.cyan,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Upload Picture", style: TextStyle(
                            color: CustomColor.primaryTextColor.withOpacity(0.3),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),),
                          IconButton(onPressed: (){}, icon: Icon(Icons.add, color: CustomColor.primaryTextColor.withOpacity(0.3),), splashColor: Colors.transparent)
                        ],
                      ),

                      Container(
                        width: double.infinity.w,
                        height: 110.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index)
                        {
                          return Container(
                            margin: EdgeInsets.only(right: 10.0),
                            width: 150.w,
                            // height: 60.h,
                            decoration: BoxDecoration(
                              color: CustomColor.primaryTextColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(25.r)
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                  width: double.infinity.w,
                  // height: 90.h,
                  decoration: BoxDecoration(
                    // color: Colors.cyan,
                    border: Border.all(
                      color: Color(0xFFAC8AE9),
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Room Title", style: TextStyle(
                        color: Color(0xFFAC8AE9),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(
                        height: 40.h,
                        child: TextField(
                          decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),

                           enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),

                           focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          
                           errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),

                           focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),


                          ),
                          style: TextStyle(
                             color: CustomColor.primaryTextColor.withOpacity(0.4),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        
                        ),
                      ),
                    ],
                  ),
                ),

                  SizedBox(
                        height: 20.h,
                      ),
                    

                 Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                  width: double.infinity.w,
                  // height: 90.h,
                  decoration: BoxDecoration(
                    // color: Colors.cyan,
                    border: Border.all(
                      color: Color(0xFFAC8AE9),
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Description", style: TextStyle(
                        color: Color(0xFFAC8AE9),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(
                        height: 90.h,
                        child: TextField(
                          maxLines: 6,
                          decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                               color: Colors.transparent,
                            ),
                          ),

                           enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),

                           focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          
                           errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),

                           focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),


                          ),
                          style: TextStyle(
                             color: CustomColor.primaryTextColor.withOpacity(0.4),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                width: double.infinity.w,
                height: 200.h,
                decoration: BoxDecoration(
                  color: CustomColor.primaryTextColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25.r)
                ),
                          ),
                       
              ],
            ),
          ),
        ),
      ),
    );
  }
}
