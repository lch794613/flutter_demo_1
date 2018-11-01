import 'package:flutter/material.dart';


class Weather extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new WeatherState();
  }

}


class WeatherState extends State<Weather>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(bottomOpacity:0.0),
      body:Stack(
        children: <Widget>[
          Container(color: Colors.orange,),
          Container(
          decoration: BoxDecoration(
            gradient:LinearGradient(
              begin:Alignment.topCenter,
              end:Alignment.bottomCenter,
              colors:<Color>[
                const Color(0xff1bb0ee),
                const Color(0xffc1dae4)
              ]
            )
          ),
            child:
          ListView.builder(
          itemCount:4,
          padding: EdgeInsets.all(0.0),
          itemBuilder:(BuildContext context, int index){
            if(index == 0) return Header();
            if(index == 1) return Neck();
            if(index == 2) return Body();
            if(index == 3) return Foot();
          },
          ),),
          
        ],
      ),
      );
  }

}

class Header extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(),
        decoration: BoxDecoration(
          color: Color(0x00FFFF),
          
          border: Border(bottom: BorderSide(color: Color(0xFFDDDDDD)))),
        height: 350.0,
        child: Column(
          children:<Widget>[
            Padding(padding: EdgeInsets.only(top:100.0),
            child: Text("苏州市",
                style: TextStyle(fontSize:35.0,color: Colors.white),),),
            Text("天气晴朗",style: TextStyle(fontSize:20.0,color: Colors.white),),
            Padding(
              padding: EdgeInsets.only(top:20.0),
              child:Row(mainAxisAlignment:MainAxisAlignment.center,
              children:<Widget>[
              Text("15",style: TextStyle(fontSize:60.0,color: Colors.white)),
              Text("°",style: TextStyle(fontSize:30.0,color: Colors.white,height:0.0),)
            ]
            )),
            Container(
              height: 80.0,
              // padding: EdgeInsets.only(top: 50.0),
              alignment:Alignment.bottomCenter,
              // color: Colors.red,
               // 星期6 今天  14 16
              child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                  alignment: FractionalOffset.bottomCenter,
                    padding: EdgeInsets.only(right: 10.0),
                  child:Text("星期六",
                  style: TextStyle(color: Colors.white,fontSize: 20.0),)
                  ),
                  Container(
                  alignment: FractionalOffset.bottomCenter,
                  padding:EdgeInsets.only(right: 200.0),
                  child:Text("今天",
                  style: TextStyle(color: Colors.white,fontSize: 15.0)),),
                  Container(
                    alignment: FractionalOffset.bottomCenter,
                    padding: EdgeInsets.only(right: 10.0),
                    child:
                  Text("14",
                    style: TextStyle(
                    color: Colors.white,fontSize: 20.0))),
                  Container(padding: EdgeInsets.only(),
                    alignment: FractionalOffset.bottomCenter,
                    child:Text("16",
                    style: TextStyle(color: Colors.white,fontSize: 15.0)))
                ],
              ),
            )
          ]
        ),
    );
  }

}

class Neck extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
          color: Color(0x00FFFF),
          
          border: Border(bottom: BorderSide(color: Color(0xFFDDDDDD)))),
        
        padding: EdgeInsets.symmetric(),
        height: 100.0,
        child: ListView.builder(
          scrollDirection:Axis.horizontal,
          itemBuilder:(BuildContext context, int index){
              if(index > 20) return null;
              return RowState();
          }
        ),
    );
  }
}


class RowState extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:15.0),
      width: 66.0,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("20时",style: TextStyle(color:Colors.white),),
          Text("2"),
          Text("18°",style: TextStyle(color:Colors.white),),
    ],));
  }

}


class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(),
        height: 400.0,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RowLine(weekDay: "星期一",icon: "多云",hight: "13",low: "8",),
              RowLine(weekDay: "星期一",icon: "多云",hight: "13",low: "8",),
              RowLine(weekDay: "星期一",icon: "多云",hight: "13",low: "8",),
              RowLine(weekDay: "星期一",icon: "多云",hight: "13",low: "8",),
              RowLine(weekDay: "星期一",icon: "多云",hight: "13",low: "8",),
              RowLine(weekDay: "星期一",icon: "多云",hight: "13",low: "8",),
              RowLine(weekDay: "星期一",icon: "多云",hight: "13",low: "8",),
              RowLine(weekDay: "星期一",icon: "多云",hight: "13",low: "8",),
              RowLine(weekDay: "星期一",icon: "多云",hight: "13",low: "8",),
            ],),
        ),
    );
  }
}

class RowLine extends StatelessWidget{

  final String weekDay;
  final String hight;
  final String low;
  final String icon;

  const RowLine({Key key, this.weekDay, this.hight, this.low, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget>[
          Container(
            alignment:Alignment.centerLeft,
            padding: EdgeInsets.only(left:40.0),
            child: Text(weekDay,
            style: TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold),),),
          Container(
            padding: EdgeInsets.only(left:100.0,right: 120.0),
            alignment:Alignment.center,
            child:Text(icon,style: TextStyle(color:Colors.white,fontSize: 15.0))),
        Container(
            // padding: EdgeInsets.only(left:100.0,right: 100.0),
          
            alignment:Alignment.center,
            child:Text(hight,style: TextStyle(color:Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold))),
         Container(
            padding: EdgeInsets.only(left:10.0,right: 10.0),
            alignment:Alignment.center,
            child:Text(hight,style: TextStyle(color:Colors.white,fontSize: 15.0))),
    ]);
  }

}

class Foot extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orange,
        padding: EdgeInsets.symmetric(),
        height: 400.0,
    );
  }

}