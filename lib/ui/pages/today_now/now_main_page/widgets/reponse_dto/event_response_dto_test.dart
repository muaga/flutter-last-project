import 'package:flutter/material.dart';

class Event {
  final String title;
  final String content;
  final String picUrl;
  final Color backColor;
  final String url;

  Event(
      {required this.title,
      required this.content,
      required this.picUrl,
      required this.backColor,
      required this.url});
}

List<Event> events = [
  Event(
      title: "<연인> 포토에세이 \n 디지털 굿즈 증정!",
      content: "명대사부터 영상미까지 모두 소장하기",
      picUrl: "event_1.png",
      backColor: Colors.deepOrange,
      url: "https://www.millie.co.kr/v3/post/752543?nav_hidden=y"),
  Event(
      title: "일상을 가치있게 만드는 \n여섯 가지 독서 방법",
      content: "즐거운 독서 생활 시작해 보세요!",
      picUrl: "event_2.png",
      backColor: Colors.orange,
      url: "https://www.millie.co.kr/v3/happy/six-reading?nav_hidden=y")
];
