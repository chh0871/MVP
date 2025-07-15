import 'package:cherry_mvp/core/config/app_images.dart';
import 'package:cherry_mvp/core/router/nav_provider.dart';
import 'package:cherry_mvp/core/router/nav_routes.dart';
import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:provider/provider.dart';

class DiscoverButton extends StatelessWidget {
  const DiscoverButton({super.key});

  void _navigate(BuildContext context) {
    final navigator = Provider.of<NavigationProvider>(context, listen: false);
    navigator.navigateTo(AppRoutes.discover);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 156,
        child: Material(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(28),
            child: InkWell(
              borderRadius: BorderRadius.circular(28),
              onTap: () => _navigate(context),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                    child: Row(children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.exploreText,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.w700),
                          ),
                          Text(
                            AppStrings.discoverSomethingText,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                        ],
                      )),
                      AspectRatio(
                        aspectRatio: 1,
                        child: Ink(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        AppImages.exploreCharities)))),
                      )
                    ])),
              ),
            )));
  }
}
