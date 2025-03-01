import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/widgets/custom_text_form_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: "Product Name",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: "Product price",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: "Product Code",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: "Product Description",
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
