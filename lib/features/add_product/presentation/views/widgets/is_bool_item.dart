import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/custom_checkbox.dart';

class IsBoolItem extends StatefulWidget {
  const IsBoolItem({super.key, required this.onchanged, required this.title});

  final ValueChanged<bool> onchanged;
  final String title;
  @override
  State<IsBoolItem> createState() => _IsBoolItemState();
}

class _IsBoolItemState extends State<IsBoolItem> {
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
                TextSpan(text: widget.title),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
