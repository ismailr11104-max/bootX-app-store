import 'package:bootx_app/features/search/presentation/widget/recent_search_item.dart';
import 'package:flutter/material.dart';

class RecentSearchList extends StatelessWidget {
  final List<String> history;
  final ValueChanged<String> onItemTap;
  final ValueChanged<String> onDelete;

  const RecentSearchList({
    super.key,
    required this.history,
    required this.onItemTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: history.length,
      itemBuilder: (context, index) {
        final query = history[index];
        return RecentSearchItem(
          query: query,
          onTap: () => onItemTap(query),
          onDelete: () => onDelete(query),
        );
      },
    );
  }
}
