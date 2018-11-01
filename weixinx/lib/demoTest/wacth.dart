import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'dart:async';

class WatchDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WatchState();
  }
}

class WatchState extends State<WatchDemo> {

  List<String> recordList = ['111','123','1233','4444','5555','6666'];
  String bigTime = "00:00.00";
  String miniTime = '00:00.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("闹钟demo"),
        ),
        body: Column(
          children: <Widget>[
            WatchBorad(totalTime: bigTime,sectionTime: miniTime,),
            WatchBotton(onLeftBtn:onTapLeftBtn,onRightBtn: onTapRightBtn),
            WatchList(recordList:recordList)
          ],
        ));
  }


  onTapLeftBtn(){
    setState(() {
          // bigTime = "123";
          recordList.add("123");
          recordList.add("123");
          print("添加~~");
        });
  }

  onTapRightBtn(){
    setState(() {
          recordList.clear();
          print("清空");
          // miniTime = "3333";
        });
  }
}

class WatchBorad extends StatelessWidget {
  WatchBorad({
    Key key,this.sectionTime,this.totalTime,
  }) : super(key: key);

  final String sectionTime;
  final String totalTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
          border: Border(bottom: BorderSide(color: Color(0xFFDDDDDD)))),
      padding: EdgeInsets.only(top: 30.0),
      alignment: Alignment.center,
      height: 170.0,
      child: Column(children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 30.0),
          child: Text(sectionTime,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w100,
                  color: Color(0xFF555555))),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(sectionTime,
              style: const TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.w100,
                  color: Color(0xFF222222))),
        ),
      ]),
    );
  }
}

class WatchBotton extends StatefulWidget {

  final Function onLeftBtn;
  final Function onRightBtn;

  const WatchBotton({Key key, this.onLeftBtn, this.onRightBtn}) : super(key: key);

  @override
  createState() => WatchBottonState();
}

class WatchBottonState extends State<WatchBotton> {
  String startBtnText = '启动';
  Color startBtnColor = Color(0xFF60B644);
  String stopBtnText = '复位';
  Color underlayColor = Color(0xFFEEEEEE);
  

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 100.0,
      decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
          border: Border(bottom: BorderSide(color: Color(0xFFDDDDDD)))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Ink(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  onTap: (){widget.onLeftBtn();},
                  child: Center(
                    child: Text(stopBtnText),
                  )),
            ),
            Ink(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  onTap: (){widget.onRightBtn();},
                  child: Center(
                    child: Text(startBtnText,
                      style: TextStyle(color: startBtnColor),
                    ),
                  )),
            ),
          ]),
    );
  }
}

class WatchList extends StatelessWidget {

  final List<String> recordList;

  const WatchList({Key key, this.recordList}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: ListView.builder(
          itemCount: recordList.length,
          itemBuilder: (context, index) {
            if(index.isOdd)return Divider();

            if(index > recordList.length){
                print("大于");
            }
            return Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child:
                        Text("测试", style: TextStyle(color: Color(0xFF777777))),
                  ),
                  Expanded(
                    child: Text(
                      "${recordList[index]}",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Color(0xFF222222)),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
