import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vogel_app/core/vogel_colors.dart';

class VogelShimmer extends StatelessWidget {
  final Widget? child;

  const VogelShimmer({this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: VogelColors.lightGrey,
      highlightColor: VogelColors.lightGrey.withOpacity(0.3),
      child: child ??
          Container(
            color: VogelColors.white,
          ),
    );
  }
}
