import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class MessagePopup extends StatelessWidget {
  const MessagePopup({
    Key? key,
    required this.imageAssetPath,
    required this.title,
    required this.text,
    required this.height,
  }) : super(key: key);

  final String imageAssetPath;
  final String title;
  final String text;
  final double height;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Image(
                  image: AssetImage(imageAssetPath),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize:
                      context.watch<SettingsProvider>().settings.subTitleSize,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize:
                        context.watch<SettingsProvider>().settings.textSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SpinKitFadingCircle(
                color: kPrimaryColor,
                size: 40.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
