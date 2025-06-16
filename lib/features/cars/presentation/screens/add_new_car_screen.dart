import 'package:ashafaq/features/cars/presentation/widgets/add_new_car_page_view.dart';
import 'package:flutter/material.dart';

class AddNewCarScreen extends StatelessWidget {
  const AddNewCarScreen({super.key});
  static const pageRoute = '/add-new-car-page';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AddNewCarPageView());
  }
}
