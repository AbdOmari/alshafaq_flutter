import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/config/shared/custom_network_image.dart';
import 'package:ashafaq/config/shared/drawer/components/divider.dart';
import 'package:ashafaq/core/padding/horizontal_padding_handler.dart';
import 'package:flutter/material.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: HorizontalPaddingHandler.rightPadding(context, 16),
          leading: const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(19)),
            child: CustomNetworkImage(
              imgUrl: ImageManger.userNetworkImage,
              assetPlaceholder: ImageManger.userIcon,
              width: 60,
            ),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'M.Elmohandes',
                style: TextStyle(fontSize: 16, color: Color(0xff09051C)),
              ),
              Text(
                'mohammed000@gmail.com',
                style: TextStyle(fontSize: 8, color: Color(0xff3B3B3B)),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xffABABAB),
            size: 16,
          ),
        ),

        const DrawerDivider(),
      ],
    );
  }
}
