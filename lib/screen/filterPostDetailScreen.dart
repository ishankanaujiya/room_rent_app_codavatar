import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:room_rent_app/provider/filterPostProvider.dart';
import 'package:room_rent_app/screen/home.dart';
import 'package:room_rent_app/screen/loginScreen.dart';
import 'package:room_rent_app/screen/searchPostScreen.dart';
import 'package:room_rent_app/screen/welcomeScreen.dart';
import 'package:room_rent_app/util/customColor.dart';
import 'package:room_rent_app/util/keyForSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterPostDetailScreen extends StatefulWidget {
  const FilterPostDetailScreen({super.key});

  @override
  State<FilterPostDetailScreen> createState() => _FilterPostDetailScreenState();
}

class _FilterPostDetailScreenState extends State<FilterPostDetailScreen> {

  String selectedDistrict = "Kathmandu";

  List<String> nepalDistricts = [
    "Achham",
    "Arghakhanchi",
    "Baglung",
    "Baitadi",
    "Bajhang",
    "Bajura",
    "Banke",
    "Bara",
    "Bardiya",
    "Bhaktapur",
    "Bhojpur",
    "Chitwan",
    "Dadeldhura",
    "Dailekh",
    "Dang",
    "Darchula",
    "Dhading",
    "Dhankuta",
    "Dhanusa",
    "Dolakha",
    "Dolpa",
    "Doti",
    "Gorkha",
    "Gulmi",
    "Humla",
    "Ilam",
    "Jajarkot",
    "Jhapa",
    "Jumla",
    "Kailali",
    "Kalikot",
    "Kanchanpur",
    "Kapilvastu",
    "Kaski",
    "Kathmandu",
    "Kavrepalanchok",
    "Khotang",
    "Lalitpur",
    "Lamjung",
    "Mahottari",
    "Makwanpur",
    "Manang",
    "Morang",
    "Mugu",
    "Mustang",
    "Myagdi",
    "Nawalpur",
    "Nuwakot",
    "Okhaldhunga",
    "Palpa",
    "Panchthar",
    "Parasi",
    "Parbat",
    "Parsa",
    "Pyuthan",
    "Ramechhap",
    "Rasuwa",
    "Rautahat",
    "Rolpa",
    "Rukum East",
    "Rukum West",
    "Rupandehi",
    "Salyan",
    "Sankhuwasabha",
    "Saptari",
    "Sarlahi",
    "Sindhuli",
    "Sindhupalchok",
    "Siraha",
    "Solukhumbu",
    "Sunsari",
    "Surkhet",
    "Syangja",
    "Tanahun",
    "Taplejung",
    "Terhathum",
    "Udayapur"
  ];


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // block default back
      onPopInvoked: (didPop) {
        if (didPop) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity.w,
          // height: 100.h,
          // color: Colors.cyan,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  // color: Colors.cyan,
                  child: Stack(
                    children: [

                      Positioned(
                        left: 0,
                        right: -600,
                        bottom: 0,
                        child: Container(
                          width: 500.w,
                          height: 500.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF8A39).withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),

                      Positioned(
                        left: -450,
                        right: 0,
                        child: Container(
                          width: 500.w,
                          height: 500.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFAC8AE9).withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),


                      Center(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
                          width: 300.w,
                          height: 230.h,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFAC8AE9).withOpacity(0.1),
                                blurRadius: 6,
                                spreadRadius: 4,
                                offset: Offset(6, 6),
                              ),
                            ],
                            // shape: BoxShape.circle,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Make Your Finding Easy", style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFAC8AE9),
                              ),),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text("Select District", style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF8A39).withOpacity(0.7),
                              ),),
                              SizedBox(
                                height: 10.h,
                              ),

                             Container(
                               // margin: EdgeInsets.symmetric(horizontal: 20.0),
                               padding: EdgeInsets.only(
                                   left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                               width: double.infinity.w,
                               // height: 90.h,
                               decoration: BoxDecoration(
                                 // color: Colors.cyan,
                                 border: Border.all(
                                   color: Color(0xFFAC8AE9).withOpacity(0.3),
                                 ),
                                 borderRadius: BorderRadius.circular(15.r),
                               ),
                               child: DropdownButtonHideUnderline(

                                 child: DropdownButton(
                                   value: selectedDistrict,
                                   isExpanded: true,
                                   iconSize: 25,
                                   iconEnabledColor: Color(0xFFAC8AE9).withOpacity(0.7),
                                   iconDisabledColor: Color(0xFFAC8AE9).withOpacity(0.7),
                                   dropdownColor: Colors.white,
                                   items: nepalDistricts.map((String value){
                                     return DropdownMenuItem(
                                       value: value,
                                       child: Text(value, style: TextStyle(
                                         fontSize: 11.sp,
                                         fontWeight: FontWeight.bold,
                                         color: CustomColor.primaryTextColor.withOpacity(0.8),
                                       ),),
                                     );
                                   }).toList(),

                                   onChanged: (String ? newValue) {
                                     setState(() {
                                       if(newValue != null)
                                       {
                                         selectedDistrict = newValue;
                                       }
                                     });

                                   },
                                 ),
                               ),
                             ),

                              SizedBox(
                                height: 15.h,
                              ),

                              Center(
                                child: InkWell(
                                  onTap: ()
                                  {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchPostScreen(selectedLocation: selectedDistrict,)
                                    ));
                                  },
                                  child: Container(
                                    width: 150.w,
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFAC8AE9).withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                            "Search",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                    )
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),



                      Positioned(
                        right: -350,
                        top: -350,
                        child: Container(
                          width: 500.w,
                          height: 500.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFAC8AE9).withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),

                      Positioned(
                        left: -600,
                        right: 0,
                        bottom: -300,
                        child: Container(
                          width: 500.w,
                          height: 500.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFAC8AE9).withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),


                    ],
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
