import 'dart:ui';

import 'package:flutter/material.dart';

class DestinationWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  DestinationWidget({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 28.8),
      width: 300,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.6),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            this.imageUrl,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 19.2,
            left: 19.2,
            right: 19.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.8),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 19.2, sigmaY: 19.2),
                child: Container(
                  height: 36,
                  padding: EdgeInsets.only(left: 12, right: 14.4),
                  alignment: Alignment.centerLeft,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Center(
                        child: Text(
                          this.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.8,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
