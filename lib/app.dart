import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_mina/core/api/dio_consumer.dart';
import 'package:pro_mina/features/my_gallery/data/data_sources/my_gallery_remote_dto.dart';
import 'package:pro_mina/features/my_gallery/presentation/manager/my_gallery_cubit.dart';

import 'config/routes.dart';
import 'core/utils/my_theme_data.dart';

class MyApp extends StatelessWidget {
  final String route;

  const MyApp({required this.route, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyGalleryCubit(dto: MyGalleryRemoteDto(DioConsumer(dio: Dio())))
            ..getMyGallery(),
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: MyThemeData.lightTheme,
            initialRoute: route,
            onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
          );
        },
      ),
    );
  }
}
