import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pfa_frontend/models/teacher/cours.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/constants.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class CoursCard extends StatelessWidget {
  const CoursCard({
    Key? key,
    required this.cours,
    required this.indexItem,
    required this.press,
    required this.onDelete,
  }) : super(key: key);

  final int indexItem;
  final Cours cours;
  final void Function() press;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      height: 190.0,
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 166.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 25,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50.0,
              left: 0.0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 120.0,
                width: 150.0,
                child: Image.network(
                  cours.cours_photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 2,
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 35,
                ),
                onPressed: onDelete,
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 30,
              child: SizedBox(
                height: 140.0,
                width: size.width - 200,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        cours.titre,
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .bigTextSize,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        cours.categorie,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 72, 71, 71),
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .bigTextSize,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${cours.rating}',
                            style: TextStyle(
                              fontSize: context
                                  .watch<SettingsProvider>()
                                  .settings
                                  .smallTextSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                          const SizedBox(width: 2),
                          RatingBar.builder(
                            initialRating: cours.rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15.0,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.2),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            ignoreGestures: true,
                            onRatingUpdate: (double value) {},
                          ),
                          const SizedBox(width: 3),
                          Text(
                            "(${cours.numRated})",
                            style: TextStyle(
                              fontSize: context
                                  .watch<SettingsProvider>()
                                  .settings
                                  .smallTextSize,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 0.5,
                        vertical: kDefaultPadding / 5,
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Text(
                        '${cours.date.day}/${cours.date.month}/${cours.date.year}',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
