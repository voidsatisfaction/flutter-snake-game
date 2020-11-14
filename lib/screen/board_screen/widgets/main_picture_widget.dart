import 'package:flutter/material.dart';

class MainPictureWidget extends StatelessWidget {
  final String mainPictureUrl;
  final double height;

  MainPictureWidget({
    this.mainPictureUrl,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            mainPictureUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: 50,
          left: 15,
          right: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.navigate_before,
              color: Colors.white,
              size: 40,
            ),
            Icon(
              Icons.note_add_outlined,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
