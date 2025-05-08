import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/size_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class CustomHomeAppBar extends StatelessWidget {
  // final String userName;
  // final String greeting;
  // final String avatarUrl;

  const CustomHomeAppBar({
    Key? key,
    // required this.userName,
    // required this.greeting,
    // required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.symmetric(context: context),
      child: Row(
        children: [
          Padding(
            padding: PaddingManager.only(context: context, left: 16),
            child: CircleAvatar(
              radius: SizeManager.getSize(context).height * .03,
              backgroundColor: AppColor.lightPrimary.withOpacity(0.1),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      "https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
                  width: SizeManager.getSize(context).height * .06,
                  height: SizeManager.getSize(context).height * .06,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) =>
                          const CircularProgressIndicator(strokeWidth: 2),
                  errorWidget:
                      (context, url, error) =>
                          const Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
          ),

          Column(
            children: [
              Text(
                'صباح الخير !..',
                style: StyleManager.textStyle16(
                  context,
                  FontWeight.w400,
                ).copyWith(color: AppColor.gray),
              ),
              Text(
                'أحمد مصطفي',
                style: StyleManager.textStyle16(context, FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: PaddingManager.all(context: context, value: 15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.lightPrimary.withOpacity(0.1),
            ),

            child: SvgPicture.asset(
              IconsAssets.notification,
              width: SizeManager.getSize(context).height * .03,
            ),
          ),
        ],
      ),
    );
  }
}
