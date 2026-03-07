import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService
{
  var firebaseFirestore = FirebaseFirestore.instance.collection("registeredUserDetail");
  var firebaseFirestoreForRoomDetail = FirebaseFirestore.instance.collection("publishedRoomDetail");

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

  Future<Stream<QuerySnapshot>> getSelectedLocationRoomDetail(String selectedLocation) async
  {
    return await firebaseFirestoreForRoomDetail.where('District', isEqualTo: selectedLocation).snapshots();
  }

  updateUsersDetail(Map<String, dynamic> updatedDetail, String registeredEmail) async
  {
    try
    {
      QuerySnapshot userDetail = await firebaseFirestore.where("Email", isEqualTo: registeredEmail).get();
      DocumentSnapshot documentSnapshot = userDetail.docs.first;
      String docId = documentSnapshot.id;
      
       await firebaseFirestore.doc(docId).update({
        "FullName" : updatedDetail['Full Name'],
        "PhoneNumber" : updatedDetail['Phone Number'],
        // "SecureUrl" : updatedDetail['secureUrl'],
      });


      QuerySnapshot userDetailForRoom = await firebaseFirestoreForRoomDetail.where("Email", isEqualTo: registeredEmail).get();
      print("The total number of post are: ${userDetailForRoom.docs.length}");

      for(int i = 0; i<userDetailForRoom.docs.length; i++)
      {
         DocumentSnapshot documentSnapshotForRoom = userDetailForRoom.docs[i];
         String docIdForRoom = documentSnapshotForRoom.id;
         print(documentSnapshotForRoom['Description']);

        await firebaseFirestoreForRoomDetail.doc(docIdForRoom).update({
        "Full Name" : updatedDetail['Full Name'],
        "Phone Number" : updatedDetail['Phone Number'],
       
      });
      }
   }
    catch(e)
    {
      print(e.toString());
    }
  }

  // updateUsersDetailFromRoomDetail(String registeredEmail) async
  // {
  //   try
  //   {
  //     QuerySnapshot userDetailForRoom = await firebaseFirestoreForRoomDetail.where("Email", isEqualTo: registeredEmail).get();
  //     print("The total number of post are: ${userDetailForRoom.docs.length}");

  //     for(int i = 0; i<userDetailForRoom.docs.length; i++)
  //     {
  //        DocumentSnapshot documentSnapshotForRoom = userDetailForRoom.docs[i];
  //        String docIdForRoom = documentSnapshotForRoom.id;
  //        print(documentSnapshotForRoom['Description']);
  //       await firebaseFirestoreForRoomDetail.doc(docIdForRoom).update({
  //       "FullName" : updatedDetail['Full Name'],
  //       "PhoneNumber" : updatedDetail['Phone Number'],
  //       // "SecureUrl" : updatedDetail['secureUrl'],
  //     });
  //     }
  //   }
  //   catch(e)
  //   {
  //     print(e.toString());
  //   }
  // }

  deleteUserSpecificPost(String docId) async
  {
    return await firebaseFirestoreForRoomDetail.doc(docId).delete();

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