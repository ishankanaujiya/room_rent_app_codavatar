import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoomDetailProvider extends ChangeNotifier
{
  DocumentSnapshot? documentSnapshot;


  updateDocumentSnapshot(DocumentSnapshot documentSnapshotValue)
  {

    documentSnapshot = documentSnapshotValue;
    notifyListeners();

  }

}