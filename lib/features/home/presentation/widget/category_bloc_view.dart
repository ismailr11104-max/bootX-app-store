import 'package:bootx_app/features/home/presentation/controller/bloc_category/bloc_category_bloc.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_category/bloc_category_event.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_category/bloc_category_state.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_bloc.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_event.dart';
import 'package:bootx_app/features/home/presentation/widget/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBlocView extends StatelessWidget {
  const CategoryBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CategoryError) {
          return Center(child: Text(state.message));
        }

        if (state is CategoryLoaded) {
          return CategoriesListView(
            categories: state.categories,
            selectedCategoryId: state.selectedCategoryId,
            onCategorySelected: (categoryId) {
              final actualCategoryId = categoryId == 'all' ? '' : categoryId;
              context.read<CategoryBloc>().add(SelectCategoryEvent(categoryId));
              context.read<ProductBloc>().add(
                GetProductsEvent(categoryId: actualCategoryId),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
