import 'package:flutter/material.dart';
import 'package:ivorypay/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            margin: EdgeInsets.only(left: 20),
            width: 35.w,
            height: 35.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
                child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ))));
  }
}
