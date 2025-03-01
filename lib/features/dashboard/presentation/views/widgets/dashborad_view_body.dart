import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/widgets/custom_button.dart';

class DashboradViewBody extends StatelessWidget {
  const DashboradViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [CustomButton(text: "Add Data")],
    );
  }
}
