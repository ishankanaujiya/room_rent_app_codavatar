import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:room_rent_app/service/firebaseService.dart';

class DeletePictureFromCloudinary
{
  deletePictureFromCloudinary(String secureUrl) async
  {
    String publicId = FirebaseService().getPublicIdFromSecureUrl(secureUrl);

    final url = Uri.parse(
        "https://backend-for-cloudinary.vercel.app/delete");

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "public_id": publicId
        }),
      );

      if (response.statusCode == 200) {
        print("Deleted Successfully");
      } else {
        print("Failed to delete");
      }
    } catch (e) {
      print(e);
    }
  }
}

