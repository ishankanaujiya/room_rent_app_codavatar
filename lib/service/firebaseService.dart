import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService
{
  var firebaseFirestore = FirebaseFirestore.instance.collection("userDetail");
  var firebaseFirestoreForRoomDetail = FirebaseFirestore.instance.collection("roomDetail");

  storeUserDetail(Map<String, dynamic> userDetail) async
  {
    return await firebaseFirestore.doc().set(userDetail);
    
  }

  
  Future<QuerySnapshot>getSignedInUserDetail(String userEmail) async
  {
    return firebaseFirestore.where("Email", isEqualTo: userEmail).get();
  }

  storeRoomDetail(Map<String, dynamic> roomDetail) async
  {
    return await firebaseFirestoreForRoomDetail.doc().set(roomDetail);
  }

  Future<Stream<QuerySnapshot>> getRoomDetail() async
  {
    return await firebaseFirestoreForRoomDetail.snapshots();
  }

  updateUsersDetail(Map<String, dynamic> updatedDetail, String registeredEmail) async
  {
    try
    {
      QuerySnapshot userDetail = await firebaseFirestore.where("Email", isEqualTo: registeredEmail).get();
      DocumentSnapshot documentSnapshot = userDetail.docs.first;
      String docId = documentSnapshot.id;
      
      return await firebaseFirestore.doc(docId).update({
        "FullName" : updatedDetail['Full Name'],
        "PhoneNumber" : updatedDetail['Phone Number'],
        // "SecureUrl" : updatedDetail['secureUrl'],
      });
    }
    catch(e)
    {
      print(e.toString());
    }
  }

  Future<Stream<QuerySnapshot>>getloggedInUserPostedRoom(String email) async
  {
    return await firebaseFirestoreForRoomDetail.where("Email", isEqualTo: email).snapshots();

  }


  getPublicIdFromSecureUrl(String secureUrl) {
    print("This is the publicId method");
    print("This is SecureUrl $secureUrl");

    String fileName = secureUrl.split('/').last;


    String publicId = fileName.split('.').first;

    print("Extracted publicId: $publicId");
    return publicId;
  }

  updateProfilePicture(String email, String updatedSecureUrl) async
  {
    QuerySnapshot querySnapshot = await firebaseFirestore.where("Email", isEqualTo: email).get();
    DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

    String docId = documentSnapshot.id;
    return await firebaseFirestore.doc(docId).update({
      "SecureUrl" : updatedSecureUrl,
    });


  }

}