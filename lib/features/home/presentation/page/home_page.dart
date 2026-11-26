import 'package:bootx_app/core/services/service_locator/setup_service_locator.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_category/bloc_category_bloc.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_category/bloc_category_event.dart';
import 'package:bootx_app/features/home/presentation/widget/custom_home_appbar.dart';
import 'package:bootx_app/features/home/presentation/widget/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String homeRouts = 'home_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryBloc>(
      create: (context) => getIt<CategoryBloc>()..add(LoadCategoriesEvent()),
      child: Scaffold(appBar: CustomHomeAppBar(), body: Homebody()),
    );
  }
}
