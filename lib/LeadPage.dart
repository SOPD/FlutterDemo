import 'package:pjcj_flutter/common/PublicHeader.dart';

import 'package:pjcj_flutter/Root/RootPage.dart';
import 'package:pjcj_flutter/common/HardwareIO.dart';

class LeadPage extends StatefulWidget{

//  int _currentPage = 0;

  @override
  _LeadPageState createState() => new _LeadPageState();

}
class _LeadPageState extends State<LeadPage>{

  AnimationPage aniPage = new AnimationPage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(alignment: Alignment.center,
      children: <Widget>[
       new Image(image:new AssetImage('assets/images/guidepage_bg.png')),
        new PageView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            new Image(image: new AssetImage('assets/images/guidepage_01.png')),
            new Image(image: new AssetImage('assets/images/guidepage_02.png')),
            new Image(image: new AssetImage('assets/images/guidepage_03.png')),
            aniPage,
          ],
          onPageChanged:startPagePaged,
        )
      ],
    );
  }
  void startPagePaged(int page){

    if (page == 3 ){
      aniPage.btn.startAnimation();
    }

  }

}

class AnimationPage extends StatefulWidget{


  AnimationBtn btn = new AnimationBtn(Title: '开启新版',);


  @override
  _AnimationPageState createState() => new _AnimationPageState();
}
class _AnimationPageState extends State<AnimationPage>{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Center(
          child:   new Image(image: new AssetImage('assets/images/guidepage_04.png')),
        ),
        Positioned(

          bottom: 60,
          child: widget.btn
       )
      ],
    );
  }
}

class AnimationBtn extends StatefulWidget{

  final String Title;
  AnimationController controller;
  Animation<double> animation;

  void startAnimation(){
    if(controller == null){
      return;
    }
     controller.forward();

  }
AnimationBtn({Key key,this.Title}):super(key:key);
  @override
  _AnimationBtnState createState() => new _AnimationBtnState();
}
class _AnimationBtnState extends State<AnimationBtn> with SingleTickerProviderStateMixin{


  @override
  void initState() {
    widget.controller = new AnimationController(duration: const Duration(seconds: 2),vsync: this);
    widget.animation = new Tween(begin: 0.0 , end: 60.0).animate(widget.controller)..addListener((){setState(() {

    });});
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new OutlineButton(onPressed: intoAppBtnClick,child: Text(widget.Title ,style:new TextStyle(color: Color.fromRGBO(100, 10, 10, widget.animation.value/60)) ,),);
  }

//开启新版
  void intoAppBtnClick() {
//写入开启标记
     HardwareIO.instance.readAppVersion((String version){
       HardwareIO.instance.setUserDefault('startInfo', 'alreadyOpen' + version ,(String result){

       });
     });
     Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context){return new RootPage();}),  (Route<dynamic> route) => false,);

  }
  dispose() {
    //路由销毁时需要释放动画资源
    widget.controller.dispose();
    super.dispose();
  }
}