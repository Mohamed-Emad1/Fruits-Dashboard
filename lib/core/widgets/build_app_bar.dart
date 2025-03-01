import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/app_text_styles.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: AppTextStyles.bold28),
  );
}
