import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pfa_frontend/utils/color.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    Key? key,
    required this.imageAssetPath,
    required this.height,
  }) : super(key: key);

  final String imageAssetPath;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: BottomSemiCircleClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: height,
            padding: EdgeInsets.all(20),
            color: kPrimaryColor,
            child: Center(
              child: Image.asset(
                imageAssetPath,
              ),
            ),
          ),
        ),
        Positioned(
            left: 10,
            top: 20,
            child: FadeInUp(
              duration: const Duration(seconds: 1),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: kWhiteColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )),
        Positioned(
          left: 40,
          width: 80,
          height: 80,
          child: FadeInUp(
              duration: const Duration(seconds: 1),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/clock.png'))),
              )),
        ),
      ],
    );
  }
}

class BottomSemiCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height + 50, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
