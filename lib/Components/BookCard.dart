import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {

  final String coverUrl;
  final String title;
  final VoidCallback ontap;

  const BookCard({super.key, required this.coverUrl, required this.title, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: InkWell(
        onTap: ontap,
        child: SizedBox(
          width: 140,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ensure the column does not try to take up more space than necessary
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(3, 3),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    coverUrl,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
