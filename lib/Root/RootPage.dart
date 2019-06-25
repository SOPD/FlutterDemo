import 'package:pjcj_flutter/common/PublicHeader.dart';

import 'package:pjcj_flutter/Home/HomePage.dart';
import 'package:pjcj_flutter/Market/MarketPage.dart';
import 'package:pjcj_flutter/Self/SelfPage.dart';
class RootPage extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
  // TODO: implement createState
  return new _RootPageState();
  }

}

class _RootPageState extends State<RootPage>{
  Function changeSkinFunction;

  int _selectedIndex = 0;

 final List<Widget> pages = [
   HomePage(), MarketPage(),SelfPage()
 ];
  @override
  void initState() {
    print('root init');

    changeSkinFunction  = (){
      setState(() {

      });
    };
    SkinConfig().regChangeAction(changeSkinFunction);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
        child: new Scaffold(
          bottomNavigationBar:  BottomNavigationBar( // 底部导航
            items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页'),activeIcon: Icon(Icons.center_focus_weak)),
            BottomNavigationBarItem(icon: Icon(Icons.view_list), title: Text('市场'),activeIcon: Icon(Icons.center_focus_weak)),
            BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('我的'),activeIcon: Icon(Icons.accessibility)),
         ]  ,

        fixedColor: SkinConfig.instance.mainColor(),

        currentIndex: _selectedIndex,
        onTap: onNaviTap,

      ),
         body:new IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),

    ),
        onWillPop: ()async{
      return false;
    });
  }

  void onNaviTap(int index){
    setState(() {
      _selectedIndex = index;
    });

  }
@override
  void dispose() {
    // TODO: implement dispose

  SkinConfig().unRegChangeAction(changeSkinFunction);
    super.dispose();
  }


}