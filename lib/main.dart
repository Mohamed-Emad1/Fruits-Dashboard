import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/helper_functions/on_generate_route.dart';
import 'package:fruits_dashboard/features/dashboard/presentation/views/dashboard_view..dart';

void main() {
  runApp(const DashboradApp());
}

class DashboradApp extends StatelessWidget {
  const DashboradApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
