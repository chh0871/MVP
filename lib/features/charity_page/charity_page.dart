import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/features/search/search_viewmodel.dart';

import 'widgets/charity_card.dart';

class CharityPage extends StatefulWidget {
  const CharityPage({super.key});

  @override
  CharityPageState createState() => CharityPageState();
}

class CharityPageState extends State<CharityPage> {
  // ignore: unused_field
  final _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<SearchViewModel>(builder: (context, viewModel, child) {
      final charities = viewModel.fetchCharityCategories();

      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.reply,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            onPressed: () {},
          ),
          title: Text(AppStrings.charitiesText),
          centerTitle: true,
          actions: [],
        ),
        body: Container(
            padding: EdgeInsets.only(top: 5),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 40,
                  child: SearchAnchor.bar(
                      barHintText: 'Search items',
                      isFullScreen: true,
                      suggestionsBuilder: (context, controller) => []),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8)),
              Expanded(
                child: ListView.builder(
                  itemCount: charities.length,
                  itemBuilder: (context, index) {
                    return CharityCard(charity: charities[index]);
                  },
                ),
              ),
            ])),
      );
    });
  }
}
