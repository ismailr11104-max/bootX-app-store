import 'package:bootx_app/core/wigets/custom_app_bar.dart';
import 'package:bootx_app/features/search/presentation/widget/search_bloc_view.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const searchRoute = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Search'),
      body: const SafeArea(child: SearchBlocView()),
    );
  }
}
