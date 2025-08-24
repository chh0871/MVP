import 'package:cherry_mvp/core/models/model.dart';
import 'package:cherry_mvp/core/utils/status.dart';
import 'package:cherry_mvp/features/categories/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class CategoryViewModel extends ChangeNotifier {
  final ICategoryRepository categoryRepository;
  final _log = Logger('CategoryViewModel');

  CategoryViewModel({required this.categoryRepository});

  Status _status = Status.uninitialized;

  Status get status => _status;

  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<void> fetchCategories() async {
    _status = Status.loading;
    notifyListeners();

    try {
      final result = await categoryRepository.fetchCategories();
      if (result.isSuccess && result.value != null) {
        _categories = result.value!;
        _status = Status.success;
      } else {
        _status = Status.failure(result.error ?? 'Could not load categories');
        _log.warning('Fetch categories failed! ${result.error}');
      }
    } catch (e) {
      _status = Status.failure(e.toString());
      _log.severe('Fetch categories error:: $e');
    }

    notifyListeners();
  }
}
