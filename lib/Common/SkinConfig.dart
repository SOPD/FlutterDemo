
import 'package:pjcj_flutter/common/PublicHeader.dart';
import 'package:pjcj_flutter/common/HardwareIO.dart';
import 'dart:math';

const String skinStyleKey = 'skinStyle';
const String skinStyleDay = 'day';
const String skinStyleNight = 'night';



//色彩控制板 单例类
class SkinConfig{

  List<Function> changeReceiver = new List();

  //配色列表
  static List skinStyleList = [
    skinStyleDay,
    skinStyleNight
  ];
  //配色类型标记
  static String _skinStyle = skinStyleDay;

  factory SkinConfig() =>_getInstance();
  static SkinConfig get instance => _getInstance();
  static SkinConfig _instance;
  SkinConfig._internal() {

    // 初始化
  }

  static SkinConfig _getInstance() {
    if (_instance == null) {
      _instance = new SkinConfig._internal();
      _instance.readDefaultModel();
    }
    return _instance;
  }



  //读取已保存的配色
  void readDefaultModel(){
    HardwareIO.instance.readUserDefault(skinStyleKey, (String value){
      if(skinStyleList.contains(value)){
        _skinStyle = value;
      }else{
        _skinStyle = skinStyleDay;
      }
      for(int i = 0 ; i < changeReceiver.length;i++){

        Function function = changeReceiver[i];
        function();

      }

    });
  }


  void regChangeAction(Function function()){
       changeReceiver.add(function);
       print(changeReceiver.toString());
  }


  void unRegChangeAction(Function function()){
    changeReceiver.remove(function);
    print(changeReceiver.toString());

  }
  //轮换配色
  void switchModel(){
    int currentIndex = skinStyleList.indexOf(_skinStyle);
    int destIndex = 0;
    if(currentIndex < skinStyleList.length - 1){
      destIndex = currentIndex + 1;
    }
    _skinStyle = skinStyleList.elementAt(destIndex);

    //保存已选配色类型
    HardwareIO.instance.setUserDefault(skinStyleKey, skinStyleList.elementAt(destIndex),(String result){});

    for(int i = 0 ; i < changeReceiver.length;i++){

      Function function = changeReceiver[i];
      function();

  }

}
//主色
  Color mainColor(){

      Color color ;
   switch (_skinStyle) {
      case skinStyleDay : color = Color(0xFFFFBE00);
      break;
      case skinStyleNight : color = Color(0xFF333333);
      break;

}
    return color;
}

//主背景色
  Color mainBGColor(){

    Color color ;
    switch (_skinStyle) {
      case skinStyleDay : color = Color(0xFFF8F8F8);
      break;
      case skinStyleNight : color = Color(0xFF191C29);
      break;

    }
    return color;
  }

  //次背景色
  Color secBGColor(){

    Color color ;
    switch (_skinStyle) {
      case skinStyleDay : color = Color(0xFFFFFFFF);
      break;
      case skinStyleNight : color = Color(0xFF1C1F2D);
      break;

    }
    return color;
  }

  //一级标题颜色
  Color titleTextColor(){

    Color color ;
    switch (_skinStyle) {
      case skinStyleDay : color = Color(0xFF333333);
      break;
      case skinStyleNight : color = Color(0xFFFFFFFF);
      break;

    }
    return color;
  }


  //二级标题颜色
  Color subTitleTextColor(){

    Color color ;
    switch (_skinStyle) {
      case skinStyleDay : color = Color(0xFF333333);
      break;
      case skinStyleNight : color = Color(0xFFFFFFFF);
      break;

    }
    return color;
  }


  Color randomColor(){

    return Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0);
}


}

