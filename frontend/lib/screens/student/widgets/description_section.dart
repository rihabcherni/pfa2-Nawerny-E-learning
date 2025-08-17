import 'package:flutter/material.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class DescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: TextStyle(
              fontSize: context.watch<SettingsProvider>().settings.textSize,
              color: Colors.black,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Course Length",
                style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.subTitleSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              //Spacer(),
              //SizedBox(width:5 ,),
              Icon(
                Icons.timer,
                color: Color.fromARGB(255, 2, 44, 141),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "26 Hours",
                style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Rating ",
                style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.subTitleSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(
                width: 5,
              ),
              Text("4.5",
                  style: TextStyle(
                    fontSize:
                        context.watch<SettingsProvider>().settings.bigTextSize,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
