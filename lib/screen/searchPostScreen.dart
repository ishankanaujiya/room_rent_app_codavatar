import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:room_rent_app/provider/filterPostProvider.dart';
import 'package:room_rent_app/provider/roomDetailProvider.dart';
import 'package:room_rent_app/screen/displayRoomDetail.dart';
import 'package:room_rent_app/screen/filterPostDetailScreen.dart';
import 'package:room_rent_app/screen/settingScreen.dart';
import 'package:room_rent_app/service/deletePictureFromCloudinary.dart';
import 'package:room_rent_app/service/firebaseService.dart';
import 'package:room_rent_app/util/keyForSharedPreference.dart';
import 'package:room_rent_app/widget/circularLoading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPostScreen extends StatefulWidget {
  final String selectedLocation;
  const SearchPostScreen({super.key, this.selectedLocation = "Kathmandu"});

  @override
  State<SearchPostScreen> createState() => _SearchPostScreenState();
}

class _SearchPostScreenState extends State<SearchPostScreen> {

  Stream? selectedRoomDetail;

  getSelectedRoomDetail() async
  {
    print("This is selected room method");
    selectedRoomDetail = await FirebaseService().getSelectedLocationRoomDetail(widget.selectedLocation);
    setState(() {

    });
  }

  @override
  void initState() {
    getSelectedRoomDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // block default back
      onPopInvoked: (didPop) {
        if (didPop) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => FilterPostDetailScreen()),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 25.0, left: 15.0),
                  width: double.infinity.w,
                  // height: 100.h,
                  // color: Colors.cyan,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Available Rooms,",
                        style: TextStyle(
                          color: Color(0xFF5C1196),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "${widget.selectedLocation}",
                        style: TextStyle(
                          color: Color(0xFFFF8A39).withOpacity(0.8),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                    width: double.infinity.w,
                    // color: Colors.cyan,
                    child: StreamBuilder(
                        stream: selectedRoomDetail,
                        builder: (context, AsyncSnapshot snapshot)
                        {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularLoadingScreen();
                          }

                          if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
                            return Container(
                              alignment: Alignment.topCenter,
                              width: double.infinity.w,
                              height: 200.h,
                              // color: Colors.cyan,
                              child: Container(
                                width: double.infinity.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 228, 225, 225).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(15.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(255, 66, 58, 58).withOpacity(0.1),
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                        offset: Offset(4, 3),
                                      )
                                    ]
                                ),
                                child: Center(child: Text("Opps! No Rooms Available Yet.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),)),
                              ),
                            );
                          }
                          return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot documentSnapshot = snapshot.data.docs[index];

                                return Container(
                                  // color: Colors.cyan,
                                  width: double.infinity.w,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    onTap: ()
                                    {
                                      Provider.of<RoomDetailProvider>(context, listen: false).updateDocumentSnapshot(documentSnapshot);
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DisplayRoomDetail()
                                      ));
                                    },
                                    child: Container(
                                      width: double.infinity.w,
                                      margin: EdgeInsets.only(bottom: 30.0),
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(115, 240, 240, 240),
                                        borderRadius:
                                        BorderRadius.circular(20.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            // color: Colors.cyan,
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  // margin: EdgeInsets.only(bottom: 10.0),
                                                  width: 130.w,
                                                  height: 140.h,

                                                  decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20.r),
                                                  ),

                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(15.r),
                                                    child: Image(image: NetworkImage(documentSnapshot['secureUrl'][0]), fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        // color: Colors.cyan,
                                                        width: 150.w,
                                                        child: Text(
                                                          documentSnapshot['Room Title'],
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),

                                                      SizedBox(
                                                        height: 5.h,
                                                      ),

                                                      Container(
                                                        width: 150.w,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Room Price: ",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 9.sp,
                                                                fontWeight:
                                                                FontWeight.w600,
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              width: 5.w,
                                                            ),

                                                            Text(
                                                              "Rs. ${documentSnapshot['Room Price']}",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 9.sp,
                                                                fontWeight:
                                                                FontWeight.w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      Container(
                                                        width: 150.w,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Location: ",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 9.sp,
                                                                fontWeight:
                                                                FontWeight.w600,
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              width: 5.w,
                                                            ),

                                                            Container(
                                                              // color: Colors.cyan,
                                                              width: 100.w,
                                                              child: Text(
                                                                documentSnapshot['Location'],
                                                                style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 9.sp,
                                                                  fontWeight:
                                                                  FontWeight.w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      Container(
                                                        width: 150.w,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "District: ",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 9.sp,
                                                                fontWeight:
                                                                FontWeight.w600,
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              width: 5.w,
                                                            ),

                                                            Text(
                                                              widget.selectedLocation,
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 9.sp,
                                                                fontWeight:
                                                                FontWeight.w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });

                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
