import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String bandTitle;
  final String bandCategory;
  final int memberCount;
  final Color invitationColor;
  final Color writeButtonColor;

  TitleWidget({
    this.bandTitle,
    this.bandCategory,
    this.memberCount,
    this.invitationColor,
    this.writeButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.2,
            color: Colors.black38,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 6,
                    ),
                    child: Row(
                      children: [
                        Text(
                          bandTitle,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_sharp,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "$bandCategory ・ 멤버 $memberCount ・ ",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_circle_rounded,
                                color: invitationColor,
                                size: 16,
                              ),
                              Text(
                                ' 초대',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: invitationColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                FlatButton(
                  height: 32,
                  minWidth: 75,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: writeButtonColor,
                  child: Text(
                    '글쓰기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
