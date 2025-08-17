import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/responsive.dart';
import 'package:pfa_frontend/utils/size_config.dart';
import 'package:pfa_frontend/utils/style.dart';

class InfoCard extends StatelessWidget {
  final Icon icon;
  final String label;
  final String amount;

  InfoCard({required this.icon, required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minWidth: Responsive.isDesktop(context)
              ? 180
              : SizeConfig.getInstance().screenWidth / 2 - 40),
      padding: EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 20,
          right: Responsive.isMobile(context) ? 10 : 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          SizedBox(
            height: SizeConfig.getInstance().blockSizeVertical * 2,
          ),
          PrimaryText(text: label, color: AppColors.secondary, size: 16),
          SizedBox(
            height: SizeConfig.getInstance().blockSizeVertical * 2,
          ),
          PrimaryText(
            text: amount,
            size: 18,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
