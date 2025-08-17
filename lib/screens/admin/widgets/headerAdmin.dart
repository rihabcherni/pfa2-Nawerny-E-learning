import 'package:flutter/material.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/responsive.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:pfa_frontend/utils/style.dart';
import 'package:provider/provider.dart';

class HeaderAdmin extends StatelessWidget {
  final String title;

  const HeaderAdmin({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(text: title, size: 30, fontWeight: FontWeight.w800),
            ]),
      ),
      Spacer(
        flex: 1,
      ),
      Expanded(
        flex: Responsive.isDesktop(context) ? 1 : 3,
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              contentPadding: EdgeInsets.only(left: 40.0, right: 5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: AppColors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: AppColors.white),
              ),
              prefixIcon:
                  Icon(Icons.search, color: Color.fromARGB(255, 255, 255, 255)),
              hintText: 'Search',
              hintStyle: TextStyle(
                color: AppColors.secondary,
                fontSize:
                    context.watch<SettingsProvider>().settings.smallTextSize,
              )),
        ),
      ),
    ]);
  }
}
