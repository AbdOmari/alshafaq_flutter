import 'package:ashafaq/config/shared/price_widget.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/home/domain/entities/packages/package.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/badge_widget.dart';
import 'package:ashafaq/features/home/presentation/widgets/package/base_package_widget_base.dart';
import 'package:flutter/material.dart';

class SingleWashPackageCard extends StatelessWidget {
  const SingleWashPackageCard({
    super.key,
    required this.package,
    required this.d,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  });
  final Package package;
  final Dimensions d;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BasePackageCard(
        imgUrl: package.imageUrl,
        backgroundColor: backgroundColor,
        d: d,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      package.name,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                  const Flexible(child: BadgeWidget(content: 'Top')),
                ],
              ),
            ),
            Text(
              package.features.first,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(fontSize: 9, color: textColor),
              textAlign: TextAlign.start,
              softWrap: true, // optional, true by default
              overflow:
                  TextOverflow
                      .visible, // or ellipsis/fade if you want overflow behavior
              maxLines: null,
            ),
            Flexible(
              child: PriceWidget(price: package.price, priceColor: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
