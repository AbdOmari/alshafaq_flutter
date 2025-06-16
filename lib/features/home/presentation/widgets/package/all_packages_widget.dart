import 'package:ashafaq/config/shared/price_widget.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/home/data/models/saving_package.dart';
import 'package:ashafaq/features/home/domain/entities/packages/package.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/badge_widget.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/saving_package_card_price.dart';
import 'package:ashafaq/features/home/presentation/widgets/package/base_package_widget_base.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AllPackagesCard extends StatelessWidget {
  const AllPackagesCard({super.key, required this.package, required this.d});
  final Package package;
  final Dimensions d;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: BasePackageCard(
              imgUrl: package.imageUrl,
              d: d,
              content: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Text(
                                package.name,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Flexible(
                              child: BadgeWidget(
                                content: appLocalizations.special,
                                badgeColor: const Color(0xff2EE600),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${package.value}x ${appLocalizations.washes} \n ${package.features.first}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(fontSize: 9),
                        ),

                        PackagePriceWidget(package: package),

                        Flexible(
                          child: PriceWidget(
                            price: package.singlePrice,
                            fontSize: 9,
                            trailingText: appLocalizations.perOneWash,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Image.asset(ImageManger.alarm, fit: BoxFit.fill),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PackagePriceWidget extends StatelessWidget {
  const PackagePriceWidget({super.key, required this.package});

  final Package package;

  @override
  Widget build(BuildContext context) {
    if (package is SavingPackage) {
      return SavingPackageCardPrice(
        price: package.price,
        discountedPrice: (package as SavingPackage).discountedPrice,
      );
    } else {
      return SavingPackageCardPrice(
        price: package.price,
        discountedPrice: null,
      );
    }
  }
}
