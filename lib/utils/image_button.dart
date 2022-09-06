import 'package:flutter/material.dart';

class ImageTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ImageProvider image;
  final double imageHeight;
  final double imageWidth;
  final double radius;
  final Widget text;

  ImageTextButton({
    @required this.onPressed,
    @required this.image,
    this.imageHeight = 40,
    this.imageWidth = 40,
    this.radius = 5,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 300,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 5),
              Ink.image(
                image: image,
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 6),
              text,
              SizedBox(width: 6),
            ],
          ),
        ),
      ),
    );
  }
}