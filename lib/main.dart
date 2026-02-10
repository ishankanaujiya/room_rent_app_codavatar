import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:room_rent_app/provider/circularLoadingProvider.dart';
import 'package:room_rent_app/provider/multiplePictureDisplayProvider.dart';
import 'package:room_rent_app/provider/roomDetailProvider.dart';
import 'package:room_rent_app/provider/sharedPreferenceForUserDetailProvider.dart';
import 'package:room_rent_app/screen/addRoomDetail.dart';
import 'package:room_rent_app/screen/customerServiceAndSupportScreen.dart';
import 'package:room_rent_app/screen/displayRoomDetail.dart';
import 'package:room_rent_app/screen/editProfileScreen.dart';
import 'package:room_rent_app/screen/home.dart';
import 'package:room_rent_app/screen/loginScreen.dart';
import 'package:room_rent_app/screen/postDetailScreen.dart';
import 'package:room_rent_app/screen/registrationScreen.dart';
import 'package:room_rent_app/screen/selectMultiplePicture.dart';
import 'package:room_rent_app/screen/settingScreen.dart';

void main() async 
{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MultiplePictureDisplayProvider(),),
      ChangeNotifierProvider(create: (context) => SharedPreferenceForUserDetailProvider(),),
      ChangeNotifierProvider(create: (context) => CircularLoadingProvider(),),
      ChangeNotifierProvider(create: (context) => RoomDetailProvider(),),
    ],
    child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const CustomerServiceAndSupportScreen(),
      ),
    );
  }
}
