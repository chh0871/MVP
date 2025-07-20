import 'package:cherry_mvp/core/models/model.dart';
import 'package:cherry_mvp/core/services/network/api_endpoints.dart';
import 'package:cherry_mvp/core/services/network/api_service.dart';
import 'package:cherry_mvp/core/utils/utils.dart';
import 'home_model.dart';

abstract class IHomeRepository {
  Future<Result<List<Product>>> fetchProducts();
}

final class HomeRepository implements IHomeRepository {
  final ApiService _apiService;

  HomeRepository(this._apiService);

  @override
  Future<Result<List<Product>>> fetchProducts() async {
    try {
      final result = await _apiService.get(ApiEndpoints.products);

      if (result.isSuccess && result.value != null) {
        final data = result.value;
        final List<dynamic> jsonList = data['data'] ?? data;
        final products = jsonList.map((json) => Product.fromJson(json)).toList();
        return Result.success(products);
      } else {
        return Result.failure(result.error ?? 'Failed to fetch products');
      }
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

final class HomeRepositoryMock implements IHomeRepository {

  @override
  Future<Result<List<Product>>> fetchProducts() async {
    return Result.success(dummyProducts);
  }
}