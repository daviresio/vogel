import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_spacing.dart';

//Component to display a centralized message with title, description and optionally an image
class VogelCenterMessage extends StatelessWidget {
  final Widget? image;
  final String title;
  final String description;

  const VogelCenterMessage({
    this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: VogelSpacing.big1),
        margin: EdgeInsets.only(bottom: VogelSpacing.huge1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null) image!,
            SizedBox(height: VogelSpacing.medium1),
            Text(
              title,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: VogelSpacing.medium1),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
