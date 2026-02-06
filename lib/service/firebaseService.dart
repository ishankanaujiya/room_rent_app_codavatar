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
}