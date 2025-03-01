import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/add_product_view.dart';

class DashboradViewBody extends StatelessWidget {
  const DashboradViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: "Add Data",
          onPressed: () {
            Navigator.pushNamed(context, AddProductView.routeName);
          },
        ),
      ],
    );
  }
}
