import 'package:bootx_app/core/helper_functions/get_dummy_product.dart';
import 'package:bootx_app/core/utils/app_image.dart';
import 'package:bootx_app/core/wigets/app_empty_view.dart';
import 'package:bootx_app/core/wigets/app_error_view.dart';
import 'package:bootx_app/core/wigets/product_grid_view.dart';
import 'package:bootx_app/features/search/presentation/controller/search_bloc/search_bloc.dart';
import 'package:bootx_app/features/product_details/presentation/page/product_details_page.dart';
import 'package:bootx_app/features/search/presentation/controller/search_bloc/search_state.dart';
import 'package:bootx_app/features/search/presentation/widget/search_history_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchBodyContent extends StatelessWidget {
  final ValueChanged<String> onSelect;
  final ValueChanged<String> onDelete;

  const SearchBodyContent({
    super.key,
    required this.onSelect,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return CustomScrollView(
            slivers: [
              SliverSkeletonizer(
                enabled: true,
                child: ProductGridView(products: getDummyProduct),
              ),
            ],
          );
        }

        if (state is SearchError) {
          return AppErrorView(message: state.message);
        }

        if (state is SearchSuccess) {
          return CustomScrollView(
            slivers: [
              ProductGridView(
                products: state.products,
                onProductTap: (_) =>
                    Navigator.of(context)
                        .pushNamed(ProductDetailsPage.detailsRoute),
              ),
            ],
          );
        }

        if (state is SearchInitial || state is SearchEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state is SearchInitial && state.history.isNotEmpty)
                SearchHistoryView(
                  history: state.history,
                  onSelect: onSelect,
                  onDelete: onDelete,
                ),

              if (state is SearchEmpty)
                Expanded(
                  child: AppEmptyView(
                    title: 'No Products Found',
                    subtitle:
                        'We couldn\'t find products matching \n'
                        '"${state.query}". Try a different keyword.',
                  ),
                )
              else if (state.history.isEmpty)
                const Expanded(
                  child: AppEmptyView(
                    title: 'Find Your Products',
                    subtitle:
                        'Search for your favorite products '
                        'using the search bar above.',
                    image: AppImage.searchEmpty,
                  ),
                ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
