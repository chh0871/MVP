import 'package:cherry_mvp/core/services/services.dart';
import 'package:cherry_mvp/core/utils/result.dart';

abstract class ICheckoutRepository {
  Future<Result> fetchNearestInPosts(String postalCode);
}

final class CheckoutRepository implements ICheckoutRepository {
  final ApiService _apiService;
  CheckoutRepository(this._apiService);

  @override
  Future<Result> fetchNearestInPosts(String postalCode) async {
    try {
      final result = await _apiService.get(
          "${ApiEndpoints.inpostLockers} ?postcode=$postalCode&maxDistance=30");
      if (result.isSuccess && result.value != null) {
        final data = result.value;

        final jsonList = data['data'] ?? data;
        //<List<Locker>>
        // final categories =
        //     jsonList.map((json) => Category.fromJson(json)).toList();
        return Result.success(jsonList);
      } else {
        return Result.failure(result.error ??
            'Pickup points currently unavailable, please try again later');
      }
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
