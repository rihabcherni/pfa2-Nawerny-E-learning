import 'package:flutter/material.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/constants.dart';

class CoursImage extends StatelessWidget {
  const CoursImage({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: size.width * 0.4,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size.width * 0.4,
            width: size.width * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
            ),
          ),
          ClipOval(
            child: Image.network(
              image,
              height: size.width * 0.4,
              width: size.width * 0.4,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
