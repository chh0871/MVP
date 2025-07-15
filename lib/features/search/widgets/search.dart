import 'package:cherry_mvp/core/config/app_images.dart';
import 'package:cherry_mvp/features/categories/category_repositoy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: context.read(),
      viewHintText: 'AI Search: Red Polka Dot Dress',
      suggestionsBuilder: (context, controller) => [
        for (final category
            in context.read<CategoryRepositoy>().fetchCategories())
          ListTile(
            onTap: () {},
            leading: Image.asset(
              category.image,
              width: 32,
              height: 32,
            ),
            title: Text(category.name),
            trailing: Icon(Icons.chevron_right),
          )
      ],
      builder: (context, controller) => Image.asset(AppImages.icSearch,
          width: 24,
          height: 24,
          color: Theme.of(context).colorScheme.secondary),
    );
  }
}
