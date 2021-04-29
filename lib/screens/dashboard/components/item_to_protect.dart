import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_spacing.dart';

//Item of category on DashboardScreen
class ItemToProtect extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  final String title;

  const ItemToProtect({
    required this.image,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Here I use a FittedBox to reduce the size if don't have space to fit this element on the screen
            FittedBox(
              child: Image.asset(
                image,
                width: 56,
                height: 56,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: VogelSpacing.small2),
            //Here I use a FittedBox to reduce the size if don't have space to fit this element on the screen
            FittedBox(
              child: Text(
                '$title',
                style: Theme.of(context).textTheme.overline,
              ),
            ),
            SizedBox(height: VogelSpacing.tiny2),
            Image.asset(
              'assets/images/unprotected.png',
              width: 18,
              height: 18,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
