import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:room_rent_app/provider/multiplePictureDisplayProvider.dart';
import 'package:room_rent_app/service/pictureToCloudinary.dart';

class SelectMultiplePicture extends StatefulWidget {
  const SelectMultiplePicture({super.key});

  @override
  State<SelectMultiplePicture> createState() => _SelectMultiplePictureState();
}

class _SelectMultiplePictureState extends State<SelectMultiplePicture> {

  List<String> secureUrlFromCloudinary = [];

      // ImagePicker pickPicture = new ImagePicker();

      // List<XFile> selectedPicture = [];

      // List<File> convertedPicture = [];

  // selectMultiplePicture() async
  // {

  //     selectedPicture = await pickPicture.pickMultiImage(
  //       imageQuality: 80,
  //       // maxWidth: 1024,
  //       // maxHeight: 1024,
  //     );

  //     for(int i = 0; i<selectedPicture.length; i++)
  //     {
  //       print("The Selected Pictures are: ${selectedPicture[i].path}");
      
  //     }
  //     setState(() {
        
  //     });
  // }
  @override
  Widget build(BuildContext context) {
    print("This is main build");
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity.w,
            height: 200.h,
            color: Colors.cyan,
            child: Center(
              child: Consumer<MultiplePictureDisplayProvider>(
                builder: (context, displayProvider, _)
                {
                   print("This is Container build");
                  return ElevatedButton(
                    onPressed: ()
                    {
                      Provider.of<MultiplePictureDisplayProvider>(context, listen: false).updateSelectedPictureList();
                    
                    },
                 child: Text("Select Picture"),
                 );
                },
              ),
            ),
          ),
           Container(
                width: double.infinity.w,
                height: 400.h,
                color: Colors.white,
                child: Consumer<MultiplePictureDisplayProvider>(
            builder: (context, displayProvider, _)
            {
              print("This is Display build");
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Provider.of<MultiplePictureDisplayProvider>(context,listen: false).selectedPicture.length,
                    itemBuilder: (context, index)
                    {
                      return Container(
                        margin: EdgeInsets.only(right: 20.0),
                        width: 200.w,
                        height: 200.h,
                        // color: Colors.black,
                        // child: Image.file(File(displayProvider.selectedPicture[index].path), fit: BoxFit.contain,),
                         child: Image.file(File(Provider.of<MultiplePictureDisplayProvider>(context,listen: false).selectedPicture[index].path), fit: BoxFit.contain,),
                      );
                    
                    }
                    );
            },
                ),
              ),

              Consumer<MultiplePictureDisplayProvider>(
                builder: (context, uploadPictureToCloudinary, _)
                {

                  return ElevatedButton(onPressed: () async
                {
                  for(int i = 0; i<Provider.of<MultiplePictureDisplayProvider>(context,listen: false).selectedPicture.length; i++)
                  {
                    XFile? selectedPicturePath = await Provider.of<MultiplePictureDisplayProvider>(context,listen: false).selectedPicture[i];
                    File? convertedValue = File(selectedPicturePath.path);

                   String secureUrl = await PictureToCloudinary().uploadPictureToCloudinary(convertedValue);
                   secureUrlFromCloudinary.add(secureUrl);
                  
                  }
                  print("Value are");
                  print(secureUrlFromCloudinary);
                }, child: Text("Send Photo"),
                );
                },
                
              ),
          
        ],
      ),
    );
  }
}