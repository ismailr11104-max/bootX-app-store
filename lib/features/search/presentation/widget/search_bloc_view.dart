import 'package:bootx_app/core/wigets/custom_search_bar.dart';
import 'package:bootx_app/features/search/presentation/controller/search_bloc/search_bloc.dart';
import 'package:bootx_app/features/search/presentation/controller/search_bloc/search_event.dart';
import 'package:bootx_app/features/search/presentation/widget/search_body_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBlocView extends StatefulWidget {
  const SearchBlocView({super.key});

  @override
  State<SearchBlocView> createState() => _SearchBlocViewState();
}

class _SearchBlocViewState extends State<SearchBlocView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchProducts(String query) {
    context.read<SearchBloc>().add(SearchProductsEvent(query));
  }

  void _clearSearch() {
    _searchController.clear();

    context.read<SearchBloc>().add(const LoadSearchHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchBar(
          controller: _searchController,
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: _clearSearch,
          ),
          onSubmitted: _searchProducts,
        ),

        const SizedBox(height: 16),

        Expanded(
          child: SearchBodyContent(
            onSelect: (query) {
              _searchController.text = query;
              _searchProducts(query);
            },
            onDelete: (query) {
              context.read<SearchBloc>().add(DeleteSearchHistoryEvent(query));
            },
          ),
        ),
      ],
    );
  }
}
