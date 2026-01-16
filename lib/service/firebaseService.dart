import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService
{
  var firebaseFirestore = FirebaseFirestore.instance.collection("userDetail");

  storeUserDetail(Map<String, dynamic> userDetail) async
  {
    return await firebaseFirestore.doc().set(userDetail);
  }
}