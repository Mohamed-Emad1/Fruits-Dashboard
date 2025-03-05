import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/helper_functions/build_error_bar.dart';
import 'package:fruits_dashboard/core/helper_functions/build_success_snackbar.dart';
import 'package:fruits_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruits_dashboard/features/add_product/manager/cubit/add_product_cubit.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
            buildSucessSnackBar(context, "Product added successfully");
        } else if (state is AddProductFailure) {
          buildErrorBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductLoading,
          child: const AddProductViewBody(),
        );
      },
    );
  }
}
