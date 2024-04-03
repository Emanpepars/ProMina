import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class ProMinaTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  const ProMinaTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.textInputAction,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      cursorHeight: 20.h,
      controller: controller,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.labelSmall,
        contentPadding: EdgeInsets.only(
          bottom: 16.h,
          top: 12.h,
          right: 21.w,
          left: 21.w,
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelMedium,
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(
              25.sp,
            ),
          ),
        ),
      ),
    );
  }
}
