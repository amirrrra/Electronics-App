import 'package:flutter/material.dart';
import 'search_field_widget.dart';

class SearchAppbarWidget extends StatelessWidget {
  const SearchAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 6),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
            const Expanded(child: SearchFieldWidget())
          ],
        ),
      ),
    );
  }
}
