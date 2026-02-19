import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:room_rent_app/provider/roomDetailProvider.dart';
import 'package:room_rent_app/screen/home.dart';
import 'package:room_rent_app/util/customColor.dart';

class DisplayRoomDetail extends StatefulWidget {
  const DisplayRoomDetail({super.key});

  @override
  State<DisplayRoomDetail> createState() => _DisplayRoomDetailState();
}

class _DisplayRoomDetailState extends State<DisplayRoomDetail> {

 
  @override
  Widget build(BuildContext context) {

    return PopScope(
       canPop: false, // block default back
        onPopInvoked: (didPop) {
          if (didPop) return;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
          );
        },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Consumer<RoomDetailProvider>(
            builder: (context, documentSnapshotValue, _)
            {
              final snapshot = documentSnapshotValue.documentSnapshot;
      
              if (snapshot == null || !snapshot.exists) {
                return Text("Null");
              }
              final value = snapshot.data() as Map<String, dynamic>;
      
      
              return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity.w,
                    height: 420.h,
                    decoration: BoxDecoration(
                       color: Color.fromARGB(255, 203, 179, 252).withOpacity(0.1),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(450.r)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 15,
                          top: 17,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Hi,",
                                style: TextStyle(
                                 color: Color(0xFFFF8A39),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "From ${value?['Full Name']}" ?? "",
                                style: TextStyle(
                                 color: Color(0xFF6B3ACD),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                    
                         Positioned(
                          left: 0,
                          right: 0,
                          top: 105,
                          child: Container(
                            padding: EdgeInsets.only(left: 20.0),
                            // margin: EdgeInsets.only(left: 20.0, right: 0.0),
                            // width: double.infinity.w,
                            height: 150.h,
                            // color: Colors.cyan,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value['secureUrl'].length,
                              itemBuilder: (context, index)
                            {
                              return  Container(
                              margin: EdgeInsets.only(right: 10.0),
                              width: 190.w,
                              height: 150.h,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 190, 190, 190)
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.r),
                                child: Image.network(value['secureUrl'][index], fit: BoxFit.contain,),
                                ),
                            );
                        
                    
                            })
                          ),
                        ),
                        
                       
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 245,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            width: double.infinity.w,
                            height: 100.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 180.w,
                                  // color: Colors.cyan,
                                  child: Text(
                                     value?['Room Title'] ?? "",
                                    style: TextStyle(
                                      color: Color(0xFF6B3ACD),
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                                left: 20.0,
                                              ),
                                      alignment: Alignment.centerRight,
                                      // color: Colors.cyan,
                                      child: Text(
                                         "Rs. ${value?['Room Price']}" ?? "",
                                        style: TextStyle(
                                          color: Color(0xFF0F766E),
                                          fontSize: 19.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // left: 0,
                          // right: 0,
                          top: 310,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            width: 200.w,
                            height: 60.h,
                            // color: Colors.cyan,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_pin,
                                  size: 15,
                                  color: CustomColor.primaryTextColor
                                      .withOpacity(0.2),
                                ),
                                Text(
                                  "Location: ",
                                  style: TextStyle(
                                    color: CustomColor.primaryTextColor
                                        .withOpacity(0.2),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                               
                                SingleChildScrollView(
                                  child: Container(
                                    width: 100.w,
                                    child: Text(
                                      value?['Location'] ?? "",
                                      style: TextStyle(
                                        color: CustomColor.primaryTextColor
                                            .withOpacity(0.2),
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: double.infinity.w,
                    // height: 100.h,
                    // color: Colors.cyan,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Description",
                          style: TextStyle(
                            color: Color(0xFF6B3ACD),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                             value?['Description'] ?? "",
                          style: TextStyle(
                            color: CustomColor.primaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: double.infinity.w,
                    // height: 100.h,
                    // color: Colors.cyan,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Room Detail",
                          style: TextStyle(
                            color: Color(0xFF6B3ACD),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 20.0),
                          width: double.infinity.w,
                          // height: 200.h,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 203, 179, 252).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Room Price (Per Month)",
                                    style: TextStyle(
                                     //color: Colors.white,
                                      fontSize: 13.sp,
                                     fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    width: 100.w,
                                    child: Text(
                                        "Rs. ${value?['Room Price']}" ?? "",
                                      style: TextStyle(
                                        color: Color(0xFFFF8A39),
                                        fontSize: 13.sp,
                                       fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Number of Rooms",
                                    style: TextStyle(
                                     //color: Colors.white,
                                      fontSize: 13.sp,
                                     fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    width: 100.w,
                                    // color: Colors.cyan,
                                    child: Text(
                                         "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${value?['Number Of Room']}" ?? "",
                                      style: TextStyle(
                                        color: Color(0xFFFF8A39),
                                        fontSize: 13.sp,
                                       fontWeight: FontWeight.w500,
                                      ),
                                     
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Number of Bathrooms",
                                    style: TextStyle(
                                     //color: Colors.white,
                                      fontSize: 13.sp,
                                     fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    width: 100.w,
                                    child: Text(
                                         value?['Number Of Bathroom'] ?? "",
                                      style: TextStyle(
                                        color: Color(0xFFFF8A39),
                                        fontSize: 13.sp,
                                       fontWeight: FontWeight.w500,
                                      ),
                                       textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Square Feet",
                                    style: TextStyle(
                                     //color: Colors.white,
                                      fontSize: 13.sp,
                                     fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                  width: 100.w,
                                    child: Text(
                                        value?['Square Feet'] ?? "",
                                      style: TextStyle(
                                        color: Color(0xFFFF8A39),
                                        fontSize: 13.sp,
                                       fontWeight: FontWeight.w500,
                                      ),
                                       textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Electricity Price (Per)",
                                    style: TextStyle(
                                     //color: Colors.white,
                                      fontSize: 13.sp,
                                     fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    width: 100.w,
                                    child: Text(
                                        value?['Electricity Price'] ?? "",
                                      style: TextStyle(
                                        color: Color(0xFFFF8A39),
                                        fontSize: 13.sp,
                                       fontWeight: FontWeight.w500,
                                      ),
                                       textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Water Price",
                                    style: TextStyle(
                                     //color: Colors.white,
                                      fontSize: 13.sp,
                                     fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    width: 100.w,
                                    child: Text(
                                         value?['Water Price'] ?? "",
                                      style: TextStyle(
                                        color: Color(0xFFFF8A39),
                                        fontSize: 13.sp,
                                       fontWeight: FontWeight.w500,
                                      ),
                                       textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                  
                  Container(
                      padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                    width: double.infinity.w,
                    // height: 100.h,
                    // color: Colors.cyan,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                    "Contact Information",
                    style: TextStyle(
                      color: Color(0xFF6B3ACD),
                      fontSize: 18.sp,
                     fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  color: Color(0xFF0F766E),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                   value?['Contact Number'] ?? "",
                                  style: TextStyle(
                                    color: CustomColor.primaryTextColor,
                                    fontSize: 13.sp,
                                   fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.email,
                                  color: Color(0xFFFF8A39),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Container(
                                  width: 140.w,
                                  child: Text(
                                       value?['Contact Email'] ?? "",
                                    style: TextStyle(
                                      color: CustomColor.primaryTextColor,
                                      fontSize: 13.sp,
                                     fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                          SizedBox(
                    height: 20.h,
                  ),
                      ],
                    ),
                  ),
                ],
              ),
            );
            },
            
          ),
        ),
      ),
    );
  }
}
