import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_mina/core/api/api_keys.dart';
import 'package:pro_mina/core/utils/app_color.dart';
import 'package:pro_mina/core/utils/cache_helper.dart';
import 'package:pro_mina/features/my_gallery/presentation/manager/my_gallery_cubit.dart';
import 'package:pro_mina/features/my_gallery/presentation/manager/my_gallery_state.dart';

import '../../../../config/routes.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/api_request_widget.dart';
import '../widgets/camera_button.dart';

class MyGallery extends StatelessWidget {
  const MyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MyGalleryCubit, MyGalleryState>(
        listener: (context, state) {
          if (state is UploadImageLoadingState) {
            Navigator.pop(context);

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: SizedBox(
                    height: 100.h,
                    child: const Center(child: CircularProgressIndicator())),
              ),
            );
          } else if (state is UploadImageSuccessState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Success',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            );
          } else if (state is UploadImageErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.failures.message,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            );
          }
        },
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.galleryBk,
                ),
                fit: BoxFit.fill,
              ),
            ),
            padding: EdgeInsets.only(
              right: 28.w,
              left: 28.w,
              top: 36.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      'Welcome \nMina',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                      ),
                      child: CircleAvatar(
                        backgroundColor: AppColors.lightWhite,
                        radius: 28.sp,
                        child: const Icon(Icons.person_outline),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ApiRequestWidget(
                      imageName: AppImages.logoutBk,
                      request: 'log out',
                      onTap: () {
                        CacheHelper.remove(ApiKeys.token);
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.login, (route) => false);
                      },
                    ),
                    ApiRequestWidget(
                      imageName: AppImages.uploadBk,
                      request: 'upload',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            alignment: Alignment.center,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 49.h,
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CameraButton(
                                  onTap: () {
                                    MyGalleryCubit.get(context).getImage();
                                  },
                                  backgroundColor: AppColors.lightBink,
                                  imageAsset: AppImages.gallery,
                                  buttonText: 'Gallery',
                                ),
                                SizedBox(
                                  height: 44.h,
                                ),
                                CameraButton(
                                  onTap: () {
                                    MyGalleryCubit.get(context).pickImage();
                                  },
                                  backgroundColor: AppColors.lightBlue2,
                                  imageAsset: AppImages.camera,
                                  buttonText: 'Camera',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                    ),
                    itemBuilder: (context, index) => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0.sp),
                      ),
                      elevation: 8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0.sp),
                        child: MyGalleryCubit.get(context).images.isEmpty
                            ? Image.asset(
                                AppImages.camera,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    MyGalleryCubit.get(context).images[index],
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                      ),
                    ),
                    itemCount: MyGalleryCubit.get(context).images.isEmpty
                        ? 10
                        : MyGalleryCubit.get(context).images.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
