import 'package:cherry_mvp/core/utils/utils.dart';
import 'package:cherry_mvp/features/categories/category_view_model.dart';
import 'package:cherry_mvp/features/categories/widget/category_empty_widget.dart';
import 'package:cherry_mvp/features/categories/widget/category_error_widget.dart';
import 'package:cherry_mvp/features/categories/widget/category_loading_widget.dart';
import 'package:cherry_mvp/features/search/widgets/category_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/config/config.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.reply,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {},
          ),
          title: Text(AppStrings.categoriesText)),
      body: DecoratedBox(
        decoration: BoxDecoration(
            //
            ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, right: 15.0, left: 15.0),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Consumer<CategoryViewModel>(
                builder: (context, categoryViewModel, _) {
              final status = categoryViewModel.status;
              final categories = categoryViewModel.categories;

              if (status.type == StatusType.loading) {
                CategoryLoadingWidget();
              } else if (status.type == StatusType.failure) {
                CategoryErrorWidget(
                  errorMessage: status.message,
                  onRetry: () => categoryViewModel.fetchCategories(),
                );
              } else if (status.type == StatusType.success) {
                if (categories.isEmpty) {
                  return CategoryEmptyWidget();
                }

                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      var item = categories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CategoryTileWidget(
                          onTap: () {},
                          image: item.imageUrl,
                          text: item.name,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    itemCount: categories.length,
                  ),
                );
              }
              return SizedBox.shrink();
            }),
          ]),
        ),
      ),
    );
  }
}
