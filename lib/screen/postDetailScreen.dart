import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:room_rent_app/provider/roomDetailProvider.dart';
import 'package:room_rent_app/screen/displayRoomDetail.dart';
import 'package:room_rent_app/screen/settingScreen.dart';
import 'package:room_rent_app/service/deletePictureFromCloudinary.dart';
import 'package:room_rent_app/service/firebaseService.dart';
import 'package:room_rent_app/util/keyForSharedPreference.dart';
import 'package:room_rent_app/widget/circularLoading.dart';
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

  bool isLoading = false;

  changeLoadingStatus(bool status) async
  {
    await Future.delayed(Duration(seconds: 2));
    isLoading = status;
    setState(() {
      
    });

  }

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
    return PopScope(
        canPop: false, // block default back
        onPopInvoked: (didPop) {
          if (didPop) return;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => SettingScreen()),
          );
        },
      child: Scaffold(
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
                            child: userProfileSecureUrl.isEmpty ? Icon(Icons.person, size: 32,) : null,
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
                                child: Center(child: Text("Not Posted Yet",
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
                                        
                                                                  Text(
                                                                  documentSnapshot['Location'],
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


                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10.0, right: 10.0),
                                                alignment: Alignment.topCenter,
                                                height: 140.h,
                                                // color: Colors.cyan,
                                                child: InkWell(
                                                  splashColor: Colors.transparent,
                                                  highlightColor: Colors.transparent,
                                                  onTap: () async
                                                  {
                                                    await FirebaseService().deleteUserSpecificPost(documentSnapshot.id);
                                                    print("Post Detail Deleted From FirebaseFirestore");
                                                    // print(documentSnapshot['secureUrl'].length);
                                                    for(int i = 0; i<documentSnapshot['secureUrl'].length; i++)
                                                    {
                                                      DeletePictureFromCloudinary().deletePictureFromCloudinary(documentSnapshot['secureUrl'][i]);
                                                      print("Value Deleted From Cloudinary");
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.delete,
                                                    size: 22,
                                                    color: Color(0xFF5C1196)
                                                        .withOpacity(0.5),
                                                  ),
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
