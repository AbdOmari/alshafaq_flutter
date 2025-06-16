import 'package:ashafaq/core/padding/horizontal_padding_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.imagePath,
    required this.label,
    this.iconBackgroundColor = const Color(0xffF6F6F6),
    this.showTrailing = true,
    required this.onTap,
  });
  final String imagePath;
  final String label;
  final Color iconBackgroundColor;
  final bool showTrailing;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 44,
          width: double.infinity,
          child: ListTile(
            contentPadding: HorizontalPaddingHandler.rightPadding(context, 16),
            leading: RoundedBoxIcon(
              iconBackgroundColor: iconBackgroundColor,
              child: _image(imagePath),
            ),
            title: Text(label, style: const TextStyle(fontSize: 12)),
            trailing:
                !showTrailing
                    ? null
                    : const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffABABAB),
                      size: 16,
                    ),
          ),
        ),
      ),
    );
  }

  Widget _image(String path) {
    const double height = 24.0;
    const double width = 24.0;
    const fit = BoxFit.fill;
    if (path.contains('svg')) {
      return SvgPicture.asset(path, width: width, height: height, fit: fit);
    }
    return Image.asset(path, width: width, height: height, fit: fit);
  }
}

class RoundedBoxIcon extends StatelessWidget {
  const RoundedBoxIcon({
    super.key,
    required this.iconBackgroundColor,
    required this.child,
  });

  final Color iconBackgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: iconBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(11)),
      ),
      child: child,
    );
  }
}
