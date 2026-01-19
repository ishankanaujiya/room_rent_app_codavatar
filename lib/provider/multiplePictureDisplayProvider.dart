import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultiplePictureDisplayProvider extends ChangeNotifier
{
  List<XFile> selectedPicture = [];

  ImagePicker pickPicture = new ImagePicker();

  updateSelectedPictureList() async
  {
    selectedPicture.clear();
     selectedPicture = await pickPicture.pickMultiImage(
        imageQuality: 80,
        // maxWidth: 1024,
        // maxHeight: 1024,
      );

      for(int i = 0; i<selectedPicture.length; i++)
      {
        print("The Selected Pictures are: ${selectedPicture[i].path}");
      
      }

      notifyListeners();
      
      
  }
}