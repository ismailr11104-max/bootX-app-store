import 'package:bootx_app/core/services/service_locator/setup_service_locator.dart';
import 'package:bootx_app/features/auth/presentation/page/sign_in_page.dart';
import 'package:bootx_app/features/auth/presentation/page/sign_up_page.dart';
import 'package:bootx_app/features/main_navigation_screen/presentation/main_navigation_view.dart';
import 'package:bootx_app/features/onboarding/presentation/page/onboarding_page.dart';
import 'package:bootx_app/features/product_details/presentation/page/product_details_page.dart';
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
    case OnboardingPage.onboardingRouts:
      return MaterialPageRoute(builder: (context) => const OnboardingPage());
    case MainNavigationView.routeBottomNavigation:
      return MaterialPageRoute(
        builder: (context) => const MainNavigationView(),
      );
    case SearchPage.searchRoute:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<SearchBloc>(),
          child: const SearchPage(),
        ),
      );
    case ProductDetailsPage.detailsRoute:
      final productId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => ProductDetailsPage(productId: productId),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
