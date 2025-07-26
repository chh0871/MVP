import 'package:cherry_mvp/core/models/model.dart';
import 'package:cherry_mvp/core/services/network/api_service.dart';
import 'package:cherry_mvp/core/services/network/api_endpoints.dart';
import 'package:cherry_mvp/core/utils/utils.dart';

abstract class ICategoryRepository {
  Future<Result<List<Category>>> fetchCategories();
}

final class CategoryRepository implements ICategoryRepository {
  final ApiService _apiService;
  CategoryRepository(this._apiService);

  @override
  Future<Result<List<Category>>> fetchCategories() async {
    try {
      final result = await _apiService.get(ApiEndpoints.categories);

      if (result.isSuccess && result.value != null) {
        final data = result.value;
        final List<dynamic> jsonList = data['data'] ?? data;
        final categories =
            jsonList.map((json) => Category.fromJson(json)).toList();
        return Result.success(categories);
      } else {
        return Result.failure(result.error ?? 'Failed to fetch categories');
      }
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  // List<Category> fetchCategories() {
  //   return [
  //     Category(
  //       name: AppStrings.womenText,
  //       image: AppImages.womanIcon,
  //     ),
  //     Category(
  //       name: AppStrings.menText,
  //       image: AppImages.menIcon,
  //     ),
  //     Category(
  //       name: AppStrings.childrenText,
  //       image: AppImages.childrenIcon,
  //     ),
  //     Category(
  //       name: AppStrings.unisexText,
  //       image: AppImages.unisexIcon,
  //     ),
  //     Category(
  //       name: AppStrings.designerText,
  //       image: AppImages.designIcon,
  //     ),
  //     Category(
  //       name: AppStrings.profilesText,
  //       image: AppImages.profileIcon,
  //     ),
  //     Category(
  //       name: AppStrings.accessoriesText,
  //       image: AppImages.accessoriesIcon,
  //     ),
  //     Category(
  //       name: AppStrings.booksText,
  //       image: AppImages.booksIcon,
  //     ),
  //     Category(
  //       name: AppStrings.toysText,
  //       image: AppImages.toysIcon,
  //     ),
  //     Category(
  //       name: AppStrings.dvdText,
  //       image: AppImages.dvdIcon,
  //     ),
  //   ];
  // }
}
