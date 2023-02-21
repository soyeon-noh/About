import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final AssetImage assetImage;
  final Widget insideWidget;
  final double paddingTop, paddingBottom;
  const Header(
      {super.key,
      required this.assetImage,
      required this.insideWidget,
      required this.paddingTop,
      required this.paddingBottom});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(image: assetImage, fit: BoxFit.fitWidth),
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: insideWidget,
    );
  }
}
