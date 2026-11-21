import 'package:flutter/material.dart';

class RecentSearchItem extends StatelessWidget {
  final String query;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const RecentSearchItem({
    super.key,
    required this.query,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(
        Icons.access_time_rounded,
        color: Color(0xFF707B81),
        size: 22,
      ),
      title: Text(
        query,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 15, color: Color(0xFF1A2530)),
      ),
      onTap: onTap,
      trailing: IconButton(
        onPressed: onDelete,
        icon: const Icon(Icons.close, size: 18, color: Color(0xFF707B81)),
      ),
    );
  }
}
