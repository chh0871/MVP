import 'package:flutter/material.dart';

import 'package:cherry_mvp/core/config/config.dart';

class SuccessfulUploadPage extends StatelessWidget {
  const SuccessfulUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.15),
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Card(
                color: Theme.of(context).colorScheme.primary,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.surface,
                    width: 12,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.surface,
                    size: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Congratulations!',
                  style: Theme.of(context).textTheme.titleSmall),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Your Item has been Successfully Uploaded.',
              ),
            ]),
          ])),

          // Button Continue
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                onPressed: () {},
                child: Text(AppStrings.continueText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
