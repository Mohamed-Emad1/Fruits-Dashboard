import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'add-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Add Product"),
      body: const SafeArea(
        child: AddProductViewBody(),
      ),
    );
  }
}
