import 'package:flutter/material.dart';
import 'package:cherry_mvp/features/home/widgets/ad_example.dart';
import 'package:cherry_mvp/features/home/widgets/dashboard.dart';
import 'package:cherry_mvp/features/home/widgets/discover_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: SearchAnchor.bar(
            barHintText: 'AI Search: Red Polka Dot Dress',
            isFullScreen: true,
            suggestionsBuilder: (context, controller) => const []),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              DiscoverButton(),
              AdExample(),
              DashboardPage(),
            ],
          ),
        ),
      ),
    );
  }
}
