import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowAlertDialog extends StatelessWidget {
  const ShowAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton.filled(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: Icon(Icons.close, color: Colors.white),
          ),
          Text(
            "اختار الصورة من الكاميرا او الاستوديو",
            style: AppStyles.styleMedium14(
              context,
            ).copyWith(color: Colors.black),
          ),
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton.filled(
            onPressed: () async {
              final image = await AppHelper.pickImaegFromGallery(context);
              Navigator.pop(context);
              if (image != null) {
                BlocProvider.of<DatabaseCubit>(context).uploadProfilePic(image);
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("لم يتم اختيار صورة")));
              }
            },
            icon: Icon(Icons.image, color: Colors.white),
          ),
          SizedBox(width: 20.w),
          IconButton.filled(
            onPressed: () {},
            icon: Icon(Icons.camera, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
