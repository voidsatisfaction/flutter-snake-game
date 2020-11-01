import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  bool loading = true;

  Widget _buildTopRow() {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     // color: Colors.,
      //     width: 8,
      //   ),
      // ),
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/trophy1.png',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          Container(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // height: 100,
                  child: Row(
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 70),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.red[500],
                              size: 30,
                            ),
                            Text(
                              '41',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    'Message',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlainRow() {}

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        top: 0,
      ),
      itemCount: 10,
      itemBuilder: (context, i) {
        // top view
        if (i == 0) {
          return _buildTopRow();
        }

        return _buildPlainRow();
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
