import 'package:bootx_app/features/auth/presentation/page/sign_in_page.dart';
import 'package:bootx_app/features/auth/presentation/page/sign_up_page.dart';
import 'package:bootx_app/features/cart/presentation/page/cart_page.dart';
import 'package:bootx_app/features/favorite/presentation/page/favorite_page.dart';
import 'package:bootx_app/features/home/presentation/page/home_page.dart';
import 'package:bootx_app/features/main_navigation_screen/presentation/main_navigation_view.dart';
import 'package:bootx_app/features/onboarding/presentation/page/onboarding_page.dart';
import 'package:bootx_app/features/profile/presentation/page/profile_page.dart';
import 'package:flutter/material.dart';

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
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
