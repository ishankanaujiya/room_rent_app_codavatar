import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:room_rent_app/provider/roomDetailProvider.dart';
import 'package:room_rent_app/screen/displayRoomDetail.dart';
import 'package:room_rent_app/service/firebaseService.dart';
import 'package:room_rent_app/util/keyForSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  Stream? selectedRoomDetail;

  String userFullName = "";
  String userEmail = "";
  String userPhoneNumber = "";
  String userProfileSecureUrl = "";

  getLoggedInUserRoomDetail() async {
    var pref = await SharedPreferences.getInstance();
    userFullName =
        await pref.getString(KeyForSharedPreference.KEYFORFULLNAME) ?? "";
    userEmail = await pref.getString(KeyForSharedPreference.KEYFOREMAIL) ?? "";
    userPhoneNumber =
        await pref.getString(KeyForSharedPreference.KEYFORPHONENUMBER) ?? "";
    userProfileSecureUrl =
        await pref.getString(KeyForSharedPreference.KEYFORPROFILESECUREURL) ??
            "";

    print(userEmail);
    selectedRoomDetail =
        await FirebaseService().getloggedInUserPostedRoom(userEmail);

    setState(() {});
  }

  @override
  void initState() {
    getLoggedInUserRoomDetail();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: Column(
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
                          backgroundColor: Colors.white, radius: 70.r,
                          backgroundImage: userProfileSecureUrl.isEmpty ? null : NetworkImage(userProfileSecureUrl),
                          child: userProfileSecureUrl.isEmpty ? Icon(Icons.person) : null,
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
                          child: Text(
                            userFullName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 190.w,
                          // color: Colors.cyan,
                          child: Text(
                            userEmail,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25.0, left: 15.0),
                width: double.infinity.w,
                // height: 100.h,
                // color: Colors.cyan,
                child: Text(
                  "Posted Rooms",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
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
                      builder: (context, AsyncSnapshot snapshot) {
                        return snapshot.hasData
                            ? ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot documentSnapshot =
                                      snapshot.data.docs[index];
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
                                                    height: 150.h,
                                      
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
                                                                      FontWeight.w500,
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
                                                                      FontWeight.w500,
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
                                                                      FontWeight.w500,
                                                                ),
                                                                ),
                                      
                                                                 SizedBox(
                                                                  width: 5.w,
                                                                ),
                                      
                                                                Text(
                                                                documentSnapshot['Location'],
                                                                style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 9.sp,
                                                                  fontWeight:
                                                                      FontWeight.w500,
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
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 10.0, right: 10.0),
                                              alignment: Alignment.topCenter,
                                              height: 140.h,
                                              // color: Colors.cyan,
                                              child: Icon(
                                                Icons.delete,
                                                size: 22,
                                                color: Color(0xFF5C1196)
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : Container(
                                child: Text("No Value"),
                              );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
