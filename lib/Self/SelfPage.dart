import 'package:pjcj_flutter/common/PublicHeader.dart';

class SelfPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SelfPageState();
  }
}

class _SelfPageState extends State<SelfPage>{
 Function changeSkinFunction ;

  @override
  void initState() {
    // TODO: implement initState
    changeSkinFunction =  (){
    setState(() {

    });
    };

    SkinConfig().regChangeAction(
       changeSkinFunction
    );

    super.initState();
  }


  @override
Widget build(BuildContext context) {
  // TODO: implement build
  return new Scaffold(
    appBar:  new AppBar(
      title: new Text('市场'),
      backgroundColor: SkinConfig().mainColor(),
    ),
  );
}

@override
  void dispose() {
    // TODO: implement dispose
  SkinConfig().unRegChangeAction(changeSkinFunction);
    super.dispose();
  }


}