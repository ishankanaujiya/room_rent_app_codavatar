import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:room_rent_app/provider/roomDetailProvider.dart';
import 'package:room_rent_app/provider/sharedPreferenceForUserDetailProvider.dart';
import 'package:room_rent_app/screen/addRoomDetail.dart';
import 'package:room_rent_app/screen/displayRoomDetail.dart';
import 'package:room_rent_app/service/firebaseService.dart';
import 'package:room_rent_app/util/customColor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? roomStream;

  getRoomDetail() async {
    roomStream = await FirebaseService().getRoomDetail();
    setState(() {});
  }
  
  getLoggedInUserDetail(BuildContext context) async
  {
    Provider.of<SharedPreferenceForUserDetailProvider>(context, listen: false).getStoredUserDetail();
  }

  getDetail() async
  {
    await getRoomDetail();
    await getLoggedInUserDetail(context);
  }

  @override
  void initState() {
     getDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("This is Main Builder");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        width: double.infinity.w,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Consumer(
                builder: (context, sharedPreferenceForSignedInUser, _)
                {
                  return Container(
                  width: double.infinity.w,
                  height: 100.h,
                  // color: Colors.cyan,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only( top: 15.0),
                        // color: Colors.cyan,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hello,",
                              style: TextStyle(
                                color: CustomColor.primaryTextColor, 
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                       
                            Text(
                            Provider.of<SharedPreferenceForUserDetailProvider>(context, listen: false).getUserFullName,
                            style: TextStyle(
                              color: Color(0xFF5C1196).withOpacity(0.6),
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                             
                              
                          
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: Provider.of<SharedPreferenceForUserDetailProvider>(context, listen: false).getUserProfileSecureUrl == "" ? null : NetworkImage(Provider.of<SharedPreferenceForUserDetailProvider>(context, listen: false).getUserProfileSecureUrl),
                        radius: 30.r,
                        child: Provider.of<SharedPreferenceForUserDetailProvider>(context, listen: false).getUserProfileSecureUrl == "" ? Icon(Icons.person, color: Colors.white,) : null,
                      ),
                    ],
                  ),
                );
                },
                
              ),
          

              Expanded(
                child: Container(
                  // height: 400.h,
                  child: StreamBuilder(
                      stream: roomStream,
                      builder: (context, AsyncSnapshot snapshot) {
                        return snapshot.hasData
                            ? ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) 
                            {
                              DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                              Timestamp timeStamp = documentSnapshot['TimeStamp'];
                              DateTime date = timeStamp.toDate();

                              String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                              print("The Value are: ");
                              print(documentSnapshot.data());
                              print(documentSnapshot['TimeStamp']);
                              

                              
                                return InkWell(
                                  onTap: ()
                                  {
                                    Provider.of<RoomDetailProvider>(context, listen: false).updateDocumentSnapshot(documentSnapshot);
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DisplayRoomDetail()
                                    ));
                                  },
                                  splashColor: Colors.transparent,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 10.0),
                                    width: double.infinity.w,
                                    decoration: BoxDecoration(
                                      // color: Colors.cyan,
                                      //  color: Color.fromARGB(255, 213, 176, 241).withOpacity(0.1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25.r),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 10.0),
                                          width: double.infinity.w,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25.r),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 10,
                                                  spreadRadius: 1,
                                                  offset: Offset(7, 10),
                                                )
                                              ]),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                  width: double.infinity.w,
                                                  height: 200.h,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                            255, 114, 100, 124)
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.r),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(25.r),
                                                    child: Image.network(
                                                        documentSnapshot['secureUrl'][0], fit: BoxFit.cover,),
                                                  )),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                ),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 17.0),
                                                width: double.infinity.w,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      documentSnapshot['Room Title'],
                                                      style: TextStyle(
                                                        color: CustomColor
                                                            .primaryTextColor,
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                  left: 15.0,
                                                ),
                                                        alignment: Alignment.centerRight,
                                                        // color: Colors.cyan,
                                                        
                                                        child: Text(
                                                          "Rs. ${documentSnapshot['Room Price']}",
                                                          style: TextStyle(
                                                            color: Color(0xFF5C1196),
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                ),
                                                margin: EdgeInsets.only(
                                                    top: 0.0, bottom: 0.0),
                                                width: double.infinity.w,
                                                child: Text(
                                                  documentSnapshot['Description'],
                                                  style: TextStyle(
                                                    color: CustomColor
                                                        .primaryTextColor
                                                        .withOpacity(0.7),
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                // color: Colors.cyan,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                ),
                                                margin: EdgeInsets.only(
                                                    top: 20.0, bottom: 15.0),
                                                width: double.infinity.w,
                                                child: Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.call,
                                                          color: Colors.green,
                                                          size: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        Text(
                                                          documentSnapshot['Contact Number'],
                                                          style: TextStyle(
                                                            color: CustomColor
                                                                .primaryTextColor
                                                                .withOpacity(0.7),
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                  
                                                     SizedBox(
                                                      height: 20.h,
                                                     ),
                                                    Row(
                                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.mail,
                                                          color: Colors
                                                              .deepOrangeAccent,
                                                          size: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 8.w,
                                                        ),
                                                        Text(
                                                          documentSnapshot['Contact Email'],
                                                          style: TextStyle(
                                                            color: CustomColor
                                                                .primaryTextColor
                                                                .withOpacity(0.7),
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    SizedBox(
                                                      height: 20.h,
                                                     ),
                                                    Row(
                                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.location_pin,
                                                          color: Color(0xFF5C1196),
                                                          size: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 8.w,
                                                        ),
                                                        Text(
                                                          documentSnapshot['Location'],
                                                          style: TextStyle(
                                                            color: CustomColor
                                                                .primaryTextColor
                                                                .withOpacity(0.7),
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    
                                                  ],
                                                ),
                                              ),
                                  
                                              Container(
                                                 padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                ),
                                                margin: EdgeInsets.only(
                                                    top: 5.0, bottom: 15.0),
                                                width: double.infinity.w,
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                    "Posted on: ",
                                                    style: TextStyle(
                                                      color: CustomColor
                                                          .primaryTextColor
                                                          .withOpacity(0.2),
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                  
                                                  Text(
                                                    // DateFormat('dd MMMM yyyy').format((documentSnapshot['TimeStamp'] as Timestamp).toDate(),),
                                                   formattedDate,
                                                    style: TextStyle(
                                                      color: CustomColor
                                                          .primaryTextColor
                                                          .withOpacity(0.2),
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                            : Text("");
                      }),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 130.w,
        height: 70.h,
        child: FloatingActionButton(
          onPressed: ()
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddRoomDetail()
            ));

          },
           child: Text("Publish Room", style: TextStyle(
            color: Colors.white,
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
           ),),
           backgroundColor: Color(0xFF5C1196).withOpacity(0.5),
           foregroundColor: Colors.white,
           splashColor: Color(0xFF5C1196),
           ),
           ),
    );
  }
}
