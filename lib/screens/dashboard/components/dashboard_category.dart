import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_spacing.dart';
import 'package:vogel_app/screens/dashboard/components/item_to_protect.dart';

class DashBoardCategory extends StatelessWidget {
  final String categoryImage;
  final String categoryName;

  final List<Widget> children;

  const DashBoardCategory({
    required this.categoryImage,
    required this.categoryName,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: VogelSpacing.extraBig1,
              bottom: VogelSpacing.big1,
            ),
            child: Row(
              children: [
                Image.asset(
                  categoryImage,
                  width: 26,
                  height: 26,
                ),
                SizedBox(
                  width: VogelSpacing.small2,
                ),
                Text(
                  categoryName,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: VogelSpacing.big1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
