import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_input_model.dart';
import 'package:fruits_dashboard/features/add_product/manager/cubit/add_product_cubit.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/is_bool_item.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  File? imagePath;
  bool isFeatured = false, isOrganic = false;
  late String name, code, description;
  late num price;
  late int expiryMonths, numberOfCalories, unitAmount;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: "Product Name",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: "Product price",
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: "Product Code",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: "Product Description",
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  expiryMonths = int.parse(value!);
                },
                hintText: "Product expiration Months",
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  unitAmount = int.parse(value!);
                },
                hintText: "Product unit amount",
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  numberOfCalories = int.parse(value!);
                },
                hintText: "Product Calories",
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              IsBoolItem(
                title: "is Featured Item?",
                onchanged: (value) {
                  isFeatured = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              IsBoolItem(
                title: "is Organic Item?",
                onchanged: (value) {
                  isOrganic = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ImageField(
                onFileChanged: (value) {
                  imagePath = value;
                  log("imagePath: $imagePath");
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                  text: "Add Product",
                  onPressed: () {
                    if (imagePath == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select an image"),
                        ),
                      );
                    }
                    if (_formKey.currentState!.validate() &&
                        imagePath != null) {
                      _formKey.currentState!.save();
                      AddProductInputEntity inputModel = AddProductInputEntity(
                        reviews: [],
                          name: name,
                          price: price,
                          code: code,
                          description: description,
                          isFeatured: isFeatured,
                          image: imagePath!,
                          expirationMonths: expiryMonths,
                          numOfCallories: numberOfCalories,
                          unitAmount: unitAmount,
                          isOrganic: isOrganic);

                      log("name: $name");
                      log("price: $price");
                      log("code: $code");
                      log("description: $description");
                      log("isFeatured: $isFeatured");
                      log("imagePath: $imagePath");
                      context.read<AddProductCubit>().addProduct(inputModel);
                    } else {
                      _autovalidateMode = AutovalidateMode.always;
                    }
                  }),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
