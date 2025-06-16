import 'package:ashafaq/config/shared/drawer/components/drawer_header.dart';
import 'package:ashafaq/config/shared/drawer/components/drawer_item.dart';
import 'package:ashafaq/config/shared/drawer/components/drawer_trailing.dart';
import 'package:ashafaq/config/shared/drawer/drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final drawerItems = getDrawerItems(context);
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36),
          child: Column(
            children: [
              const MyDrawerHeader(),
              Column(
                children: List.generate(drawerItems.length, (index) {
                  final item = drawerItems[index];
                  return DrawerItem(
                    imagePath: item.iconPath,
                    label: item.label,
                    onTap: () {
                      context.push(item.location);
                      scaffoldKey.currentState?.closeDrawer();
                    },
                  );
                }),
              ),

              const DrawerTrailing(),
            ],
          ),
        ),
      ),
    );
  }
}
