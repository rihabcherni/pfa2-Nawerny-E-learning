import 'package:flutter/material.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class CustomTitleTable extends StatelessWidget {
  const CustomTitleTable({super.key, required this.texte});

  final String texte;

  @override
  Widget build(BuildContext context) {
    return Text(
      texte,
      style: TextStyle(
        fontSize: context.watch<SettingsProvider>().settings.bigTextSize,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }
}
