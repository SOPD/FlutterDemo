import 'package:pjcj_flutter/common/PublicHeader.dart';
import 'dart:async';

class MarketPage extends StatefulWidget{
  
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MarketPageState();
  }
}
class _MarketPageState extends State<MarketPage> {
  Function changeSkinFunction;
  
   List messageList =  new List();

   Timer _timer;





  @override
  void initState() {



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
    return new Scaffold(
      appBar:new AppBar(
        title: new Text('市场'),
        backgroundColor: SkinConfig().mainColor(),

      ),
      body: new ListView.builder(
          itemCount: messageList.length,
          itemBuilder: (context,index){
            return new ListTile(
              title: Text(messageList[index]),
            );
          }
      ),

    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    SkinConfig().unRegChangeAction(changeSkinFunction);
_timer.cancel();
    super.dispose();
  }
}