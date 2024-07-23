import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ivorypay/services/navigation/navigator_service.dart';
import 'package:ivorypay/utils/app_colors.dart';

class CustomBottomSheet {
  static show(
      {BuildContext? context,
      required Widget child,
      TextStyle? titleStyle,
      bool? isDismissible}) {
    return showModalBottomSheet<void>(
      isDismissible: isDismissible != null ? false : isDismissible!,
      context: NavigatorService.navigationKey_.currentContext!,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.90,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0.r),
              topRight: Radius.circular(40.0.r),
            ),
          ),
          padding: EdgeInsets.only(top: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  height: 5.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              child,
            ],
          ),
        );
      },
    );
  }
}
