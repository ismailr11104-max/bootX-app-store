import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:bootx_app/features/search/presentation/widget/recent_search_list.dart';
import 'package:flutter/material.dart';

class SearchHistoryView extends StatelessWidget {
  final List<String> history;
  final ValueChanged<String> onSelect;
  final ValueChanged<String> onDelete;

  const SearchHistoryView({
    super.key,
    required this.history,
    required this.onSelect,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Searches', style: AppTextStyles.medium16),
          const SizedBox(height: 8),
          RecentSearchList(
            history: history,
            onItemTap: onSelect,
            onDelete: onDelete,
          ),
        ],
      ),
    );
  }
}
