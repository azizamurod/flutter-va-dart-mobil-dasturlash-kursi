import 'package:flutter/material.dart';

import '/widgets/search/last_viewed_section.dart';
import '/widgets/search/search_history_section.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchHistorySection(),
        SizedBox(height: 40),
        LastViewedSection(),
      ],
    );
  }
}
