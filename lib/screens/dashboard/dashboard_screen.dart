import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_colors.dart';
import 'package:vogel_app/core/vogel_routes.dart';
import 'package:vogel_app/core/vogel_spacing.dart';
import 'package:vogel_app/core/vogel_ui.dart';
import 'package:vogel_app/screens/dashboard/components/dashboard_category.dart';
import 'package:vogel_app/screens/dashboard/components/item_to_protect.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VogelUI.appBar(
        context,
        title: 'Vogel',
      ),
      body: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: VogelSpacing.medium2,
          //     top: VogelSpacing.big1,
          //     bottom: VogelSpacing.huge1,
          //   ),
          //   child: Image.asset(
          //     'assets/images/vogel_logo.png',
          //     width: 52,
          //     height: 72,
          //     alignment: Alignment.centerLeft,
          //   ),
          // ),
          SizedBox(height: VogelSpacing.big1),
          DashBoardCategory(
            categoryImage: 'assets/images/social_media_privacy.png',
            categoryName: 'Social Media Privacy',
            children: [
              ItemToProtect(
                image: 'assets/images/facebook.png',
                title: 'Facebook',
                onTap: () {},
              ),
              ItemToProtect(
                image: 'assets/images/google.png',
                title: 'Google',
                onTap: () {},
              ),
              ItemToProtect(
                image: 'assets/images/instagram.png',
                title: 'Instagram',
                onTap: () {},
              ),
              ItemToProtect(
                image: 'assets/images/linkedin.png',
                title: 'Linkedin',
                onTap: () {},
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(VogelSpacing.big1),
            child: Divider(
              color: VogelColors.darkGray,
            ),
          ),
          DashBoardCategory(
            categoryImage: 'assets/images/credit_file_lock.png',
            categoryName: 'Personal Credit File Lock',
            children: [
              ItemToProtect(
                image: 'assets/images/trans_union.png',
                title: 'TransUnion',
                onTap: () {},
              ),
              ItemToProtect(
                image: 'assets/images/experian.png',
                title: 'Experian',
                onTap: () {},
              ),
              ItemToProtect(
                image: 'assets/images/equifax.png',
                title: 'Equifax',
                onTap: () {},
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(VogelSpacing.big1),
            child: Divider(
              color: VogelColors.darkGray,
            ),
          ),
          DashBoardCategory(
            categoryImage: 'assets/images/privacy_monitoring.png',
            categoryName: 'Privacy Monitoring',
            children: [
              ItemToProtect(
                image: 'assets/images/data_broker.png',
                title: 'Data Broker',
                onTap: () {},
              ),
              ItemToProtect(
                image: 'assets/images/dark_web.png',
                title: 'Dark Web',
                onTap: () {
                  Navigator.of(context).pushNamed(
                    VogelRoutes.darkWebPresentation,
                  );
                },
              ),
              Container(
                width: 110,
              ),
            ],
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
