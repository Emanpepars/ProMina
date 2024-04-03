import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraButton extends StatelessWidget {
  final Color backgroundColor;
  final String imageAsset;
  final String buttonText;
  final Function()? onTap;

  const CameraButton({
    super.key,
    required this.backgroundColor,
    required this.imageAsset,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200.w,
        height: 68.4.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20.sp),
          ),
        ),
        padding: EdgeInsets.only(right: 21.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: -10 * (pi / 180),
              child: Image.asset(
                imageAsset,
                width: 66.w,
                height: 67.h,
              ),
            ),
            Text(
              buttonText,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
