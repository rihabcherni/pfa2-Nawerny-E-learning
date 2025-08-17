import 'package:flutter/material.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.texte,
    this.isLoading = false,
  });

  final void Function()? onTap;
  final String texte;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 45,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(143, 148, 251, 1),
              kPrimaryColor,
            ],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: kWhiteColor,
                  ),
                )
              : Text(
                  texte,
                  style:  TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize:
                        context.watch<SettingsProvider>().settings.bigTextSize,
                  ),
                ),
        ),
      ),
    );
  }
}
