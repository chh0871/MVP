
import 'package:cherry_mvp/features/search/search_repository.dart';
import 'package:cherry_mvp/core/models/model.dart'; 
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

class SearchViewModel extends ChangeNotifier {

  final _log = Logger('SearchViewModel');
  final SearchRepository searchRepository;

  SearchViewModel({required this.searchRepository});
 
   
  List<CharityCategory> fetchCharityCategories()  {
    return searchRepository.fetchCharityCategories();
  }
}