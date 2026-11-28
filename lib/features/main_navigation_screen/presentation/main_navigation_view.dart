import 'package:bootx_app/core/helper_functions/build_bar.dart';
import 'package:bootx_app/core/services/service_locator/setup_service_locator.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_bloc.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_event.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_state.dart';
import 'package:bootx_app/features/cart/presentation/page/cart_page.dart';
import 'package:bootx_app/features/favorite/presentation/controller/favourite_bloc.dart';
import 'package:bootx_app/features/favorite/presentation/controller/favourite_event.dart';
import 'package:bootx_app/features/favorite/presentation/page/favorite_page.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_bloc.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_event.dart';
import 'package:bootx_app/features/home/presentation/page/home_page.dart';
import 'package:bootx_app/features/profile/presentation/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'wedgit/custom_bottom_navigation.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  static const routeBottomNavigation = 'bottom_navigation';

  @override
  State<MainNavigationView> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationView> {
  int currentIndex = 0;

  void _goToHome() {
    setState(() {
      currentIndex = 0;
    });
  }

  late final List<Widget> pages = [
    const HomePage(),
    const CartPage(),
    FavoritePage(onAddProducts: _goToHome),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (_) => getIt<ProductBloc>()..add(GetProductsEvent()),
        ),

        BlocProvider<FavouriteBloc>(
          create: (_) =>
              getIt<FavouriteBloc>()..add(const GetFavouritesEvent()),
        ),

        BlocProvider<CartBloc>(
          create: (_) => getIt<CartBloc>()..add(LoadCartEvent()),
        ),
      ],
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartLoaded && state.message != null) {
            ShowBar(context, state.message!);
          }

          if (state is CartError) {
            ShowBar(context, state.message, backgroundColor: Colors.red);
          }
        },
        child: Scaffold(
          body: SafeArea(child: pages[currentIndex]),
          bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: currentIndex,
            onItemTapped: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
