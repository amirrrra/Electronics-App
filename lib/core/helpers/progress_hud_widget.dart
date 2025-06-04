import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProgressHudWidget extends StatelessWidget {
  final bool inAsyncCall;
  final Widget child;
  const ProgressHudWidget({
    super.key,
    required this.inAsyncCall,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      progressIndicator: CircularProgressIndicator(color: AppColors.primaryColor),
      child: child,
    );
  }
}
