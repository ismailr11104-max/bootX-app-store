import 'package:bootx_app/core/utils/app_image.dart';
import 'package:bootx_app/core/wigets/app_empty_view.dart';
import 'package:bootx_app/core/wigets/app_error_view.dart';
import 'package:bootx_app/core/wigets/custom_button.dart';
import 'package:bootx_app/core/wigets/product_grid_view.dart';
import 'package:bootx_app/features/favorite/presentation/controller/favourite_bloc.dart';
import 'package:bootx_app/features/favorite/presentation/controller/favourite_event.dart';
import 'package:bootx_app/features/favorite/presentation/controller/favourite_state.dart';
import 'package:bootx_app/features/favorite/presentation/widgets/favourite_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteBody extends StatelessWidget {
  final VoidCallback onAddProducts;

  const FavouriteBody({super.key, required this.onAddProducts});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        if (state is FavouriteLoading) {
          return const FavouriteLoadingView();
        }
        if (state is FavouriteError) {
          return AppErrorView(message: state.message);
        }
        if (state is FavouriteEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppEmptyView(
                  title: 'No Favourites Yet',
                  subtitle:
                      'Tap the heart icon on any product to save it here.',
                  image: AppImage.favoriteEmpty,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    text: 'Add Products',
                    onPressed: onAddProducts,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is FavouriteLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<FavouriteBloc>().add(const GetFavouritesEvent());
            },
            child: CustomScrollView(
              slivers: [
                ProductGridView(
                  products: state.favourites,
                  isAdded: false,
                  isFavorite: true,
                  onFavoriteTap: (product) {
                    context.read<FavouriteBloc>().add(
                      ToggleFavouriteEvent(product),
                    );
                  },
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
