import 'package:ashafaq/config/shared/price_widget.dart';
import 'package:ashafaq/features/request/data/models/addons/order_extra/order_extra_to_json/order_extra_to_json.dart';
import 'package:ashafaq/features/request/domain/entities/order_extra.dart';
import 'package:ashafaq/features/request/presentation/widgets/addons/add_remove_widget.dart';
import 'package:flutter/material.dart';

class OrderExtraCard extends StatelessWidget {
  const OrderExtraCard({
    super.key,
    this.initialValue,
    required this.extra,
    required this.onChanged,
  });
  final int? initialValue;
  final OrderExtra extra;
  final void Function(OrderExtraToJson extra)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      //height: 80,
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: BoxBorder.all(color: const Color(0xffEBEBEB)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Image.network(extra.image, height: 41, width: 41),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(extra.name), PriceWidget(price: extra.price)],
                ),
              ],
            ),
          ),

          Flexible(
            flex: 1,
            child: AddRemoveWidget(
              initialValue: initialValue,
              onTap: (value) {
                onChanged?.call(
                  OrderExtraToJson(extra.id, value, extra.price, extra.name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
