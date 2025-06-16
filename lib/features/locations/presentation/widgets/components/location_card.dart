import 'package:ashafaq/config/shared/buttons/custom_icon_button.dart';
import 'package:ashafaq/config/shared/drawer/components/divider.dart';
import 'package:ashafaq/config/shared/drawer/components/drawer_item.dart';
import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/features/locations/domain/entities/i_location.dart';
import 'package:flutter/material.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile({super.key, required this.location});

  final ILocation location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          leading: const RoundedBoxIcon(
            iconBackgroundColor: Colors.white,
            child: Icon(
              Icons.location_on_outlined,
              color: ColorsManger.txtGrey,
            ),
          ),
          title: Text(
            location.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            location.notes ?? '',
            style: const TextStyle(
              fontSize: 12.28,
              color: ColorsManger.txtGrey,
            ),
          ),
          trailing: CustomIconButton(
            iconBackgroundColor: ColorsManger.grey,
            icon: Icons.edit_note_outlined,
            onPressed: () {},
          ),
        ),
        const DrawerDivider(),
      ],
    );
  }
}
