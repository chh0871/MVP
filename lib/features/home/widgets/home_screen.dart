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
      body: CustomScrollView(slivers: [
        PinnedHeaderSliver(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                16, 8 + MediaQuery.of(context).padding.top, 16, 8),
            child: SearchAnchor.bar(
                barBackgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.surfaceContainerHighest),
                barHintText: 'AI Search: Red Polka Dot Dress',
                isFullScreen: true,
                suggestionsBuilder: (context, controller) => const []),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: DiscoverButton(),
          ),
        ),
        SliverPadding(padding: EdgeInsets.all(16), sliver: DashboardPage()),
        SliverToBoxAdapter(
          child: AdExample(),
        ),
      ]),
    );
  }
}
