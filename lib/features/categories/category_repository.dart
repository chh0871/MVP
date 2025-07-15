import 'package:cherry_mvp/core/config/app_images.dart';
import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:cherry_mvp/core/models/category.dart';

class CategoryRepository {
  List<Category> fetchCategories() {
    return [
      Category(
        name: AppStrings.womenText,
        image: AppImages.womanIcon,
      ),
      Category(
        name: AppStrings.menText,
        image: AppImages.menIcon,
      ),
      Category(
        name: AppStrings.childrenText,
        image: AppImages.childrenIcon,
      ),
      Category(
        name: AppStrings.unisexText,
        image: AppImages.unisexIcon,
      ),
      Category(
        name: AppStrings.designerText,
        image: AppImages.designIcon,
      ),
      Category(
        name: AppStrings.profilesText,
        image: AppImages.profileIcon,
      ),
      Category(
        name: AppStrings.accessoriesText,
        image: AppImages.accessoriesIcon,
      ),
      Category(
        name: AppStrings.booksText,
        image: AppImages.booksIcon,
      ),
      Category(
        name: AppStrings.toysText,
        image: AppImages.toysIcon,
      ),
      Category(
        name: AppStrings.dvdText,
        image: AppImages.dvdIcon,
      ),
    ];
  }
}
