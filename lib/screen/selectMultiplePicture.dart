import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectMultiplePicture extends StatefulWidget {
  const SelectMultiplePicture({super.key});

  @override
  State<SelectMultiplePicture> createState() => _SelectMultiplePictureState();
}

class _SelectMultiplePictureState extends State<SelectMultiplePicture> {


  selectMultiplePicture() async
  {
      ImagePicker pickPicture = new ImagePicker();

      List<XFile>? selectedPicture = await pickPicture.pickMultiImage();

      for(int i = 0; i<selectedPicture.length; i++)
      {
        print("The Selected Pictures are: ${selectedPicture[i].path}");
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: ()
        {
          selectMultiplePicture();
        },
         child: Text("Select Picture"),
         ),
      ),
    );
  }
}