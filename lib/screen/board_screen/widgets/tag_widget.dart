import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String tagName;

  TagWidget({
    this.tagName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '#$tagName',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
