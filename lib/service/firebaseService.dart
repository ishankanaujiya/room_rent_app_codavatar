import 'package:cloud_firestore/cloud_firestore.dart';

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
}