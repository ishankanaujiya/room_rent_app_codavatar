import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingContainer extends StatefulWidget {
  final IconData? iconData;
  final String textLabel;
  final Widget? navigationWidget;
  final bool isEnabled;
  final Color iconColor;
  final Color textColor;
  const SettingContainer(
      {super.key, this.iconData, this.navigationWidget, this.textLabel = "",this.isEnabled = true, this.iconColor = const Color(0xFF5C1196),this.textColor = Colors.black});

  @override
  State<SettingContainer> createState() => _SettingContainerState();
}

class _SettingContainerState extends State<SettingContainer> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Pressed");
      },
      child: Container(
        width: double.infinity.w,
        height: 60.h,
        // color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              // width: 200.h,
              height: double.infinity.h,
              // color: Colors.black,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                   widget.iconData,
                    color: widget.iconColor.withOpacity(0.6),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    widget.textLabel,
                    style: TextStyle(
                      color: widget.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              widget.isEnabled ? Icons.chevron_right_rounded : null,
              color: Color(0xFF5C1196).withOpacity(0.6),
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
