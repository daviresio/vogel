import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_colors.dart';
import 'package:vogel_app/core/vogel_network_image.dart';
import 'package:vogel_app/core/vogel_spacing.dart';
import 'package:vogel_app/models/breached_account/breached_account_model.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ItemLeaked extends StatelessWidget {
  final BreachedAccountModel item;

  const ItemLeaked(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: VogelSpacing.big1),
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
            child: AutoSizeText(
              'Compromissed data: ${item.dataClasses.join(', ')}',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13),
              maxLines: 6,
              minFontSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}
