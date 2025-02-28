import 'package:flutter/material.dart';
import 'package:fruits_dashboard/features/dashboard/presentation/views/widgets/dashborad_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboradViewBody(),
    );
  }
}
