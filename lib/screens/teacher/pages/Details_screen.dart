import 'package:flutter/material.dart';
import 'package:pfa_frontend/screens/teacher/widgets/Details/Details_body.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/constants.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/teacher/cours.dart';

class DetailsScreen extends StatelessWidget {
  final Cours cours;

  const DetailsScreen({required this.cours});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context),
      body: DetailsBody(cours: cours),
    );
  }

  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(right: kDefaultPadding),
        icon: const Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'Return',
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: const Color.fromARGB(
                  255, 7, 53, 91), 
              fontWeight: FontWeight.bold,
              fontSize:
                  context.watch<SettingsProvider>().settings.smallTextSize,
            ),
      ),
    );
  }
}
