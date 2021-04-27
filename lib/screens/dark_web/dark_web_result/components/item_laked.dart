import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_colors.dart';
import 'package:vogel_app/core/vogel_network_image.dart';
import 'package:vogel_app/core/vogel_spacing.dart';
import 'package:vogel_app/models/breached_account/breached_account_model.dart';

class ItemLaked extends StatelessWidget {
  final BreachedAccountModel item;

  const ItemLaked(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: VogelSpacing.tiny1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(VogelSpacing.medium2),
            margin: EdgeInsets.only(right: VogelSpacing.medium2),
            color: VogelColors.lightGrey,
            child: VogelNetworkImage(
              height: 68.0,
              width: 68.0,
              url: item.logoPath,
            ),
          ),
          Expanded(
            child: Text(
              'Compromissed data: ${item.dataClasses.join(', ')}',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
