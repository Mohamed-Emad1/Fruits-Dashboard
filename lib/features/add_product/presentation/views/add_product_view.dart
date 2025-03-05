import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_dashboard/core/services/service_locator.dart';
import 'package:fruits_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_dashboard/features/add_product/manager/cubit/add_product_cubit.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/add_product_view_body_bloc_consumer.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'add-product';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
        getIt.get<ImageRepo>(),
        getIt.get<ProductsRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(title: "Add Product"),
        body: const SafeArea(
          child: AddProductViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
