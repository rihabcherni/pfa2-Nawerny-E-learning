import 'package:flutter/material.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/style.dart';

class CategoryListTitle extends StatelessWidget {
  final IconData icon;
  final String label;
  final int courseNumber;

  const CategoryListTitle({
    required this.icon,
    required this.label,
    required this.courseNumber,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0, right: 20),
      visualDensity: VisualDensity.standard,
      leading: Container(
        width: 50,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon, 
          size: 20,
        ),
      ),
      title: PrimaryText(
        text: label,
        size: 15,
        fontWeight: FontWeight.w500,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(
            text: courseNumber.toString() + " ",
            size: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.iconGray,
          ),
        ],
      ),
      onTap: () {
        print('tap');
      },
      selected: true,
    );
  }
}
