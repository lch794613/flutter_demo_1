import 'package:flutter/material.dart';
import 'package:weixinx/constants.dart';
import 'package:weixinx/demoTest/wacth.dart';
import 'package:weixinx/demoTest/weatherDemo.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<NavigationIconView> _list;
  var _currentIndex = 0;
  PageController pageController;
  List<Widget> pages;
  @override
  void initState() {
    super.initState();
    _list = [
      NavigationIconView("微信", Icons.gamepad,Icons.add_a_photo),
      NavigationIconView("通讯录", Icons.add_location, Icons.add_to_home_screen),
      NavigationIconView("发现", Icons.add_to_queue, Icons.cake),
      NavigationIconView("我", Icons.dehaze, Icons.nature),
    ];
    pageController = PageController();
    // 第一页列表
    List<Widget> onePageList = [
        _getContainer("stopWatch",Icons.alarm, WatchDemo()),
        _getContainer("weather",Icons.all_inclusive, Weather()),
    ];
    pages = [
      ListView(children: onePageList),
      Container(color:Colors.cyanAccent),
      Container(color:Colors.yellow),
      Container(color:Colors.blue)
    ];
  }

  Widget _getContainer(String test, IconData icon,Widget goto) {
    return new Container(
      width: 160.0,
//      ListTile
      child: new ListTile(
//       显示在title之前
        leading: new Icon(icon),
//        显示在title之后
        trailing: Icon(Icons.arrow_right),
        title: new Text(test),
        subtitle:new Text("${goto.toString()}") ,
        onTap:(){
            Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => goto));
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("微信"),
        elevation: 0.0,
        backgroundColor: Color(appBarColor),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right:10.0),
            child: PopupMenuButton(
              icon: Icon(Icons.add),
              onSelected: (String select){
                print("$select 被选中了");
              },
              itemBuilder:(BuildContext b){ // 函数式的建造 返回list<widget<T>> 这样的一个结果
              return <PopupMenuItem<String>>[
                PopupMenuItem(
                  child: Row(children: <Widget>[
                    Icon(Icons.access_time,color: Colors.white,),
                    Container(width: 10.0,),
                    Text("发起群聊",style:TextStyle(color: Colors.white))
                  ]),
                  value: "发起群聊",
                ),
                PopupMenuItem(
                  child: Row(children: <Widget>[
                    Icon(Icons.access_time,color: Colors.white),
                    Container(width: 10.0,),
                    Text("添加朋友",style:TextStyle(color: Colors.white))
                  ]),
                  value: "添加朋友",
                ),
              ];
              }
            ),
          ),
        ],
      ),
      body: PageView.builder(
        itemBuilder: (var context, int index) => pages[index],
        itemCount: pages.length,
        controller: pageController,
        onPageChanged: (int index){
            print("$index was to change");
            setState(() {
              _currentIndex = index;
                        });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        items: _list.map((var view) => view._item).toList(),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index){
          print("$index 被点击了");
          setState(() {
                      _currentIndex = index;
                      pageController.animateToPage(index,
                      duration: Duration(milliseconds:200),
                      curve: Curves.easeInOut);
                    });
                    
        },
      ),
    );
  }
}

class NavigationIconView {
  final String _title;
  final IconData _icon;
  final IconData _actionIcon;
  final BottomNavigationBarItem _item;

  NavigationIconView(this._title, this._icon, this._actionIcon)
      : _item = new BottomNavigationBarItem(
            icon: Icon(_icon),
            activeIcon: Icon(_actionIcon),
            title: Text(_title),
            backgroundColor: Colors.grey);
}


