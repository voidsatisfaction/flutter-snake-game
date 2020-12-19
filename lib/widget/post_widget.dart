import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final TextStyle userNameTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
  );
  final TextStyle subTextStyle = TextStyle(
    color: Colors.grey[500],
  );

  final String bonobonoImagePath = 'assets/images/bonobono.jpeg';
  final String neoburiImagePath = 'assets/images/neoburi.jpeg';

  final String commentUserName1 = '보노보노';
  final String commentUserName2 = '너부리';

  final String comment1 = '나랑 같이 헬스장 가자 포로리야~~';
  final String comment2 = '3대 500미만 헬스장 출입권 압수!!!!';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 8,
            color: Colors.grey[300],
          ),
        ),
      ),
      child: Column(
        children: [
          PostTitleWidget(
            userNameTextStyle: userNameTextStyle,
            subTextStyle: subTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          PostContentWidget(),
          PostReactionStatusWidget(
            emoticonSize: 16,
            fontColor: Colors.black54,
            fontSize: 12,
          ),
          PostReactionActionWidget(
            emoticonSize: 20,
            fontColor: Colors.black54,
            fontSize: 12,
          ),
          PostCommentWidget(
            userImagePath: bonobonoImagePath,
            userName: commentUserName1,
            userComment: comment1,
            userPictureSize: 40,
            userNameTextStyle: userNameTextStyle,
            subTextStyle: subTextStyle,
          ),
          PostCommentWidget(
            userImagePath: neoburiImagePath,
            userName: commentUserName2,
            userComment: comment2,
            userPictureSize: 40,
            userNameTextStyle: userNameTextStyle,
            subTextStyle: subTextStyle,
          ),
        ],
      ),
    );
  }
}

class PostCommentWidget extends StatelessWidget {
  final String userImagePath;
  final String userName;
  final String userComment;

  final double userPictureSize;
  final TextStyle userNameTextStyle;
  final TextStyle subTextStyle;

  PostCommentWidget({
    this.userImagePath,
    this.userName,
    this.userComment,
    this.userPictureSize,
    this.userNameTextStyle,
    this.subTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.1,
            color: Colors.black54,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image(
                  image: AssetImage(userImagePath),
                  height: 40,
                  width: 40,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: userNameTextStyle,
                  ),
                  Text(
                    userComment,
                  ),
                ],
              ),
            ],
          ),
          Text(
            '11월 6일 21:59',
            style: subTextStyle,
          ),
        ],
      ),
    );
  }
}

class PostReactionActionWidget extends StatelessWidget {
  final double emoticonSize;
  final Color fontColor;
  final double fontSize;

  PostReactionActionWidget({
    this.emoticonSize,
    this.fontColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.1,
            color: Colors.black54,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 60,
        right: 60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.tag_faces,
                size: emoticonSize,
                color: fontColor,
              ),
              Text(
                ' 표정짓기',
                style: TextStyle(
                  color: fontColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.comment_outlined,
                size: emoticonSize,
                color: fontColor,
              ),
              Text(
                ' 댓글쓰기',
                style: TextStyle(
                  color: fontColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PostReactionStatusWidget extends StatelessWidget {
  final double emoticonSize;
  final Color fontColor;
  final double fontSize;

  PostReactionStatusWidget({
    this.emoticonSize,
    this.fontColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.thumb_up,
                    size: emoticonSize,
                    color: Colors.redAccent,
                  ),
                  Text(
                    ' 1',
                    style: TextStyle(
                      color: fontColor,
                      fontSize: fontSize,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Text(
                    "댓글 2",
                    style: TextStyle(
                      color: fontColor,
                      fontSize: fontSize,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.remove_red_eye,
                size: emoticonSize,
                color: fontColor,
              ),
              Text(
                ' 3',
                style: TextStyle(
                  color: fontColor,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PostContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '토요일 실천공약 헬스장가기 공약 실천 안하면 때릴꺼야? 때릴꺼야?때릴꺼야?때릴꺼야?때릴꺼야?',
          ),
          Text(
            '때릴꺼야?때릴꺼야?때릴꺼야?때릴꺼야?때릴꺼야?때릴꺼야?',
          ),
        ],
      ),
    );
  }
}

class PostTitleWidget extends StatelessWidget {
  final TextStyle userNameTextStyle;
  final TextStyle subTextStyle;

  PostTitleWidget({
    this.userNameTextStyle,
    this.subTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image(
                    image: AssetImage('assets/images/porori.jpeg'),
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '포로리',
                    style: userNameTextStyle,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '2시간 전',
                    style: subTextStyle,
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Icon(
              Icons.more_vert,
              color: Colors.grey[400],
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
