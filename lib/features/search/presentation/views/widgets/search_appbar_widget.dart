import 'package:electronics_app/features/search/presentation/cubits/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            Expanded(
              child: SearchFieldWidget(
                onChanged: (query) {
                  BlocProvider.of<SearchCubit>(
                    context,
                  ).fetchRelevantProducts(query);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
