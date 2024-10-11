import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shuei_ai_chat/core/theme/app_colors.dart';

class BaseImageLoadingWidget extends StatelessWidget {
  const BaseImageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: AppColors.light.colorBlue50,
      size: 40.0,
    );
  }
}
