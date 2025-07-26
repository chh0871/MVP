import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/core/utils/utils.dart';
import 'package:cherry_mvp/features/categories/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: context.read<SearchController>(),
      viewHintText: 'AI Search: Red Polka Dot Dress',
      viewBackgroundColor: Theme.of(context).colorScheme.surface,
      suggestionsBuilder: (context, controller) {
        final status = context.read<CategoryViewModel>().status;
        final categories = context.read<CategoryViewModel>().categories;
        if (status.type == StatusType.loading) {
          return [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(
                  color: AppColors.red,
                ),
              ),
            ),
          ];
        } else if (status.type == StatusType.failure) {
          return [
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  status.message ??
                      'Failed to load categories. Please try again.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ];
        } else if (status.type == StatusType.success) {
          if (categories.isEmpty) {
            return [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('No categories found.'),
                ),
              ),
            ];
          }

          return categories.map((category) {
            return ListTile(
              onTap: () {},
              leading: Image.network(
                category.imageUrl,
                width: 32,
                height: 32,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image),
              ),
              title: Text(category.name),
              trailing: const Icon(Icons.chevron_right),
            );
          }).toList();
        }

        return [];
      },
      builder: (context, controller) => Image.asset(AppImages.icSearch,
          width: 24,
          height: 24,
          color: Theme.of(context).colorScheme.secondary),
    );
  }
}
