import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/services/service_locator/setup_service_locator.dart';
import 'package:bootx_app/features/auth/presentation/page/sign_in_page.dart';
import 'package:bootx_app/features/auth/presentation/page/sign_up_page.dart';
import 'package:bootx_app/features/cart/presentation/page/cart_page.dart';
import 'package:bootx_app/features/favorite/presentation/page/favorite_page.dart';
import 'package:bootx_app/features/home/presentation/page/home_page.dart';
import 'package:bootx_app/features/main_navigation_screen/presentation/main_navigation_view.dart';
import 'package:bootx_app/features/onboarding/presentation/page/onboarding_page.dart';
import 'package:bootx_app/features/product_details/presentation/page/product_details_page.dart';
import 'package:bootx_app/features/profile/presentation/page/profile_page.dart';
import 'package:bootx_app/features/search/presentation/controller/search_bloc/search_bloc.dart';
import 'package:bootx_app/features/search/presentation/page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SignInPage.signInRouts:
      return MaterialPageRoute(builder: (context) => const SignInPage());
    case SignUpPage.signupRouts:
      return MaterialPageRoute(builder: (context) => const SignUpPage());
    case HomePage.homeRouts:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case OnboardingPage.onboardingRouts:
      return MaterialPageRoute(builder: (context) => const OnboardingPage());
    case MainNavigationView.routeBottomNavigation:
      return MaterialPageRoute(
        builder: (context) => const MainNavigationView(),
      );
    case CartPage.cartRouts:
      return MaterialPageRoute(builder: (context) => const CartPage());
    case FavoritePage.favoriteRouts:
      return MaterialPageRoute(builder: (context) => const FavoritePage());
    case ProfilePage.profileRouts:
      return MaterialPageRoute(builder: (context) => const ProfilePage());
    case SearchPage.searchRoute:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<SearchBloc>(),
          child: const SearchPage(),
        ),
      );
    case ProductDetailsPage.detailsRoute:
      final product = settings.arguments as ProductEntity;
      return MaterialPageRoute(
        builder: (_) => ProductDetailsPage(product: product),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
