import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();

    return SizedBox(
      height: 50,
      child: TextFormField(
        onChanged: (query) {},
        autofocus: true,
        cursorColor: AppColors.customColor,
        cursorHeight: 22,
        cursorWidth: 1,
        focusNode: focusNode,
        onTapOutside: (event) => focusNode.unfocus(),
        style: const TextStyle(height: 1.4, fontSize: 15),
        decoration: InputDecoration(
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          fillColor: AppColors.greyF4,
          filled: true,
          hintText: 'Search Keywords..',
          hintStyle: AppStyles.medium15.copyWith(color: AppColors.grey86),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.grey86),
        ),
      ),
    );
  }

  final outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );
}
