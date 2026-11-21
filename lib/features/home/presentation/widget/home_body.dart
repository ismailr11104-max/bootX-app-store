import 'package:bootx_app/core/wigets/custom_search_bar.dart';
import 'package:bootx_app/features/home/presentation/widget/category_bloc_view.dart';
import 'package:bootx_app/features/home/presentation/widget/product_bloc_view.dart';
import 'package:bootx_app/features/search/presentation/page/search_page.dart';
import 'package:flutter/material.dart';

class Homebody extends StatelessWidget {
  const Homebody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomSearchBar(
                onTap: () {
                  Navigator.of(context).pushNamed(SearchPage.searchRoute);
                },
                readOnly: true,
              ),
              CategoryBlocView(),
            ],
          ),
        ),
        ProductBlocView(),
      ],
    );
  }
}
