import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/app_colors.dart';
import 'package:fruits_dashboard/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.textInputType = TextInputType.text,
      this.suffixIcon,
      this.onSaved,
      this.obsecureText = false,
      this.maxLines = 1});

  final String hintText;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obsecureText;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      maxLines: maxLines,
      obscureText: obsecureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: AppColors.textFromFieldColor,
        filled: true,
        border: buildBorder(),
        hintText: hintText,
        hintStyle: AppTextStyles.bold13.copyWith(
          color: const Color(0xff949D9E),
        ),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 185, 187, 187),
        width: 1,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    );
  }
}
