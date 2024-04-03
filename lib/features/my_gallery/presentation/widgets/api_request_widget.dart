import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class ApiRequestWidget extends StatelessWidget {
  final Function()? onTap;
  final String imageName;
  final String request;

  const ApiRequestWidget(
      {super.key, this.onTap, required this.imageName, required this.request});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightWhite,
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.sp,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        height: 40.h,
        child: Row(
          children: [
            Image.asset(
              imageName,
              width: 33.w,
              height: 30.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              request,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
