import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MAvatar extends StatelessWidget {
  final String imageURL;
  final String name;
  final EdgeInsets? margin;
  final double radius;
  final double textSize;
  final Color? bgColor;
  const MAvatar(
      {Key? key,
      required this.imageURL,
      required this.name,
      this.margin,
      this.radius = 20,
      this.textSize = 16,
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Container(
      margin: margin,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: bgColor,
        backgroundImage:
            imageURL.isEmpty ? null : CachedNetworkImageProvider(imageURL),
        child: imageURL.isNotEmpty
            ? null
            : Text(
                name.isEmpty
                    ? ''
                    : name.trim().contains(" ")
                        ? name
                            .trim()
                            .split(" ")
                            .map((e) => e.substring(0, 1).toUpperCase())
                            .toList()
                            .join()
                            .substring(0, min(2, name.length))
                        : name.substring(0, 1).toUpperCase() +
                            name.substring(max(1, name.length - 1)),
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: textSize),
              ),
      ),
    );
  }
}
