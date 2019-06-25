import 'package:flutter/material.dart';
import 'LeadPage.dart';
import 'package:flutter/widgets.dart';
import 'package:pjcj_flutter/Common/HardwareIO.dart';
import 'Root/RootPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget with NavigatorObserver{
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
//    print(getBatteryLevel().toString());

    return new MaterialApp(
      home:  new MainApp(),
    );
  }

}




class MainApp extends StatefulWidget{


  _MainAppState createState() => new _MainAppState();


}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver{


  Widget result  = new Container(color: Colors.red,);

  @override
  void initState() {

  //读取版本标记

  HardwareIO.instance.readAppVersion((String version){

    print(version);
    HardwareIO.instance.readUserDefault('startInfo',
            (String value){

            if(value == 'alreadyOpen'+version){

              setState(() {
                result = new LeadPage();
              });

            }else{
              setState(() {
                result = new LeadPage();
              });


            }

        });
  });



WidgetsBinding.instance.addObserver(this);

  super.initState();

  }

  @override

   Widget build(BuildContext context) {

     return result;

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}



