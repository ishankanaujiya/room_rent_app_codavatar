import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularLoadingScreen extends StatefulWidget {
  const CircularLoadingScreen({super.key});

  @override
  State<CircularLoadingScreen> createState() => _CircularLoadingScreenState();
}

class _CircularLoadingScreenState extends State<CircularLoadingScreen> {


changeLoadingStatus() async
  {
    await Future.delayed(Duration(seconds: 2));

  }

  @override
  void initState() {
   changeLoadingStatus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 200.h,
      child: Center(
        child: CircularProgressIndicator(
          color: Color(0xFF5C1196).withOpacity(0.5),
        ),
      ),
    );
  }
}
