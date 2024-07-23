import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ivorypay/utils/app_colors.dart';
import 'package:ivorypay/utils/locator.dart';
import 'package:ivorypay/utils/progress_bar_manager/busy_dialog.dart';
import 'package:ivorypay/utils/progress_bar_manager/dialog_models.dart';
import 'package:ivorypay/utils/progress_bar_manager/dialog_service.dart';

class ProgressManager extends StatefulWidget {
  final Widget child;
  const ProgressManager({required this.child});

  _ProgressManagerState createState() => _ProgressManagerState();
}

class _ProgressManagerState extends State<ProgressManager> {
  final ProgressService _progressService = locator<ProgressService>();

  @override
  void initState() {
    super.initState();
    _progressService.registerProgressListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(ProgressRequest request) async {
    ArsProgressDialog progressDialog = ArsProgressDialog(context,
        blur: 2,
        dismissable: false,
        // backgroundColor: const Color(0x33000000),
        animationDuration: const Duration(milliseconds: 500),
        loadingWidget: Material(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                const Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                    strokeWidth: 2,
                  ),
                ),
                Image.asset(
                  'assets/icons/rypoge_icon.png',
                  width: 60,
                  height: 60,
                ),
              ],
            ),
          ),
        ));

    progressDialog.show(); // show dialog
  }
}
