import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:electronics_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String hint;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final bool obscureText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const TextfieldWidget({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.textInputType,
    this.obscureText = false,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator:
          validator ??
          (val) => val == null || val.isEmpty ? '$hint is required' : null,

      onTapOutside: (pointer) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: AppColors.primaryColor,
      style: AppStyles.semiMeduim16,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: hint,
        suffixIcon: suffixIcon,
        suffixIconColor: Color(0xFFC9CECF),
        hintStyle: AppStyles.semiBold14.copyWith(color: AppColors.grey94),
        focusedBorder: getBorder(),
        enabledBorder: getBorder(),
        border: getBorder(),
      ),
      keyboardType: textInputType,
      obscureText: obscureText,
      enableSuggestions: !obscureText,
      autocorrect: !obscureText,
    );
  }

  OutlineInputBorder getBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyE6),
      borderRadius: Constants.borderRadius5,
    );
  }
}
