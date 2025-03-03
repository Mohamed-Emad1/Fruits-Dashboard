import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/custom_checkbox.dart';

import '../../../../../core/utils/app_colors.dart';

class IsFeaturedItem extends StatefulWidget {
  const IsFeaturedItem({super.key, required this.onchanged});

  final ValueChanged<bool> onchanged;
  @override
  State<IsFeaturedItem> createState() => _IsFeaturedItemState();
}

class _IsFeaturedItemState extends State<IsFeaturedItem> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          onChanged: (value) {
            // log("value is = $value");
            isTermsAccepted = value;
            widget.onchanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: AppTextStyles.semiBold13,
              children: [
                const TextSpan(text: "is Featured Item?"),
                TextSpan(
                  text: "Accept",
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
