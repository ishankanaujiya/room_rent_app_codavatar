import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SelectMultiplePicture extends StatefulWidget {
  const SelectMultiplePicture({super.key});

  @override
  State<SelectMultiplePicture> createState() => _SelectMultiplePictureState();
}

class _SelectMultiplePictureState extends State<SelectMultiplePicture> {

      ImagePicker pickPicture = new ImagePicker();

      List<XFile> selectedPicture = [];

      List<File> convertedPicture = [];

  selectMultiplePicture() async
  {

      selectedPicture = await pickPicture.pickMultiImage(
        imageQuality: 80,
        // maxWidth: 1024,
        // maxHeight: 1024,
      );

      for(int i = 0; i<selectedPicture.length; i++)
      {
        print("The Selected Pictures are: ${selectedPicture[i].path}");
      
      }
      setState(() {
        
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity.w,
            height: 200.h,
            color: Colors.cyan,
            child: Center(
              child: ElevatedButton(onPressed: ()
              {
                selectedPicture.clear();
                setState(() {
                  
                });
                selectMultiplePicture();
              
              },
               child: Text("Select Picture"),
               ),
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity.w,
              height: 400.h,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedPicture.length,
                itemBuilder: (context, index)
                {
                  return Container(
                    margin: EdgeInsets.only(right: 20.0),
                    width: 200.w,
                    height: 200.h,
                    // color: Colors.black,
                    child: Image.file(File(selectedPicture[index].path), fit: BoxFit.contain,),
                  );
                
                }),
            ),
          )

          
        ],
      ),
    );
  }
}