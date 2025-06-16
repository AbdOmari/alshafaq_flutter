import 'package:ashafaq/config/shared/price_widget.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/home/data/models/saving_package.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/discount_time_left.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/saving_package_card_price.dart';
import 'package:ashafaq/features/home/presentation/widgets/package/base_package_widget_base.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SavingPackageCard extends StatelessWidget {
  const SavingPackageCard({super.key, required this.package, required this.d});
  final SavingPackage package;
  final Dimensions d;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return InkWell(
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
                    if (package.discountEndDate != null)
                      DiscountLeftTime(
                        discountEndDate: package.discountEndDate ?? '',
                      ),

                    Text(package.name, maxLines: 1),

                    Text(
                      '${package.value}x ${appLocalizations.washes} \n ${package.features.first}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(fontSize: 9),
                    ),

                    SavingPackageCardPrice(
                      price: package.price,
                      discountedPrice: package.discountedPrice,
                    ),

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
            ],
          ),
        ),
      ),
    );
  }
}
