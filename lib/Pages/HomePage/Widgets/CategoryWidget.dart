import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String iconPath;
  final String btnName;
  final double iconSize;
  final double textSize;
  final Color fontColor;

  const CategoryWidget({
    Key? key,
    required this.iconPath,
    required this.btnName,
    this.iconSize = 24.0,
    this.textSize = 16.0,
    this.fontColor = Colors.white, // Default font color is black
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Row(
            children: [
              SizedBox(
                width: iconSize,
                height: iconSize,
                child: Image.asset(iconPath),
              ),
              const SizedBox(width: 10),
              Text(
                btnName,
                style: TextStyle(
                  fontSize: textSize,
                  color: fontColor, // Apply font color here
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
