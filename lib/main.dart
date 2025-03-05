import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/helper_functions/on_generate_route.dart';
import 'package:fruits_dashboard/core/services/service_locator.dart';
import 'package:fruits_dashboard/core/services/simple_bloc_observer.dart';
import 'package:fruits_dashboard/features/dashboard/presentation/views/dashboard_view..dart';
import 'package:fruits_dashboard/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
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
