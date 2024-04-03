import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_mina/core/api/dio_consumer.dart';
import 'package:pro_mina/core/utils/app_color.dart';
import 'package:pro_mina/core/utils/app_images.dart';
import 'package:pro_mina/features/login/data/data_sources/login_remote_dto.dart';
import 'package:pro_mina/features/login/presentation/manager/login_cubit.dart';
import 'package:pro_mina/features/login/presentation/manager/login_state.dart';
import 'package:pro_mina/features/login/presentation/widgets/pro_mina_text_form_field.dart';

import '../../../../config/routes.dart';
import '../../../../core/api/api_keys.dart';
import '../../../../core/utils/cache_helper.dart';
import '../widgets/my_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        dto: LoginRemoteDto(
          api: DioConsumer(
            dio: Dio(),
          ),
        ),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pop(context);
            CacheHelper.saveData(ApiKeys.token, state.loginEntity.token);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Success',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            );
            Navigator.pushReplacementNamed(context, Routes.home);
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.failures.message,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            );
          } else if (state is LoginLoadingState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: SizedBox(
                    height: 100.h,
                    child: const Center(child: CircularProgressIndicator())),
              ),
            );
          }
        },
        builder: (context, state) => Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.logIn,
                  ),
                  fit: BoxFit.fill),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200.h,
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      textAlign: TextAlign.center,
                      'My Gallery',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightWhite,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          32.sp,
                        ),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 48.h, horizontal: 32.w),
                    margin: EdgeInsets.symmetric(horizontal: 41.w),
                    child: Form(
                      key: LoginCubit.get(context).loginFormKey,
                      autovalidateMode:
                          LoginCubit.get(context).autoValidateMode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Log in",
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 44.h,
                          ),
                          ProMinaTextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>
                                LoginCubit.get(context).validateEmail(value),
                            hintText: 'Email',
                            controller:
                                LoginCubit.get(context).emailEditingController,
                          ),
                          SizedBox(
                            height: 38.h,
                          ),
                          ProMinaTextFormField(
                            textInputAction: TextInputAction.done,
                            validator: (value) =>
                                LoginCubit.get(context).validatePassword(value),
                            hintText: 'Password',
                            obscureText: true,
                            controller: LoginCubit.get(context)
                                .passwordEditingController,
                          ),
                          SizedBox(
                            height: 38.h,
                          ),
                          MyButton(
                            text: "Submit",
                            onPressed: () {
                              LoginCubit.get(context).onSubmitButton(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
