import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class PictureToCloudinary
{
  static const String CLOUDNAME = "dbusoogfp";
  static const String UPLOADPRESET = "room_rent";

  uploadPictureToCloudinary(File? selectedPicture) async
  {
    final String url = "https://api.cloudinary.com/v1_1/$CLOUDNAME/upload";

    final request = http.MultipartRequest("POST", Uri.parse(url))
    ..fields['upload_preset'] = UPLOADPRESET
    ..files.add(await http.MultipartFile.fromPath(
      'file', 
      selectedPicture!.path,
      ),
    );

    final response = await request.send();
    if(response.statusCode == 200)
    {
      final convertedResponse = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(convertedResponse);
      return jsonResponse['secure_url'];

    }
    

  }

}