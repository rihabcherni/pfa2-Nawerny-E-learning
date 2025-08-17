import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/teacher/cours.dart';
import 'package:pfa_frontend/screens/teacher/widgets/Details/cours_image.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/constants.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key? key, required this.cours}) : super(key: key);

  final Cours cours;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
            decoration: const BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CoursImage(size: size, image: cours.cours_photo),
                ),
                SizedBox(height: kDefaultPadding / 5),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: Text(
                    cours.titre,
                    style: TextStyle(
                      color: Color.fromARGB(255, 39, 47, 90),
                      fontSize:
                          context.watch<SettingsProvider>().settings.titleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Date ${cours.date.day}/${cours.date.month}/${cours.date.year}',
                  style: TextStyle(
                    fontSize:
                        context.watch<SettingsProvider>().settings.textSize,
                    fontWeight: FontWeight.w600,
                    color: kSecondaryColor,
                  ),
                ),
                SizedBox(height: kDefaultPadding / 2),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .smallTextSize,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 39, 47, 90),
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Text(
                        cours.description,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 37, 36, 36),
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .bigTextSize,
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Text(
                        "Niveau",
                        style: TextStyle(
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .smallTextSize,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 39, 47, 90),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        cours.niveau,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 37, 36, 36),
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .bigTextSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cours.contents.length,
              itemBuilder: (context, index) {
                final content = cours.contents[index];
                return ListTile(
                  leading: Icon(
                    _getIcon(content.runtimeType),
                    color: Colors.white,
                  ),
                  title: Text(
                    content.titre ?? '',
                    style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Description: ${content.description ?? ''}',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(Type type) {
    if (type == ContenuTexte) {
      return Icons.text_fields;
    } else if (type == ContenuImage) {
      return Icons.image;
    } else if (type == ContenuVideo) {
      return Icons.video_library;
    } else if (type == ContenuAudio) {
      return Icons.audiotrack;
    }
    return Icons.help_outline;
  }
}
