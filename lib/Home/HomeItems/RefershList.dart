import 'package:pjcj_flutter/common/PublicHeader.dart';
typedef headerRefersh = void Function(Function stopRef);
class RefershScroller extends StatefulWidget{

  IndexedWidgetBuilder builder;
   int count;

   bool refershing = false;
   headerRefersh ref;
  @override
  RefershScroller({Key key,this.builder,this.ref,this.count});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RefershScrollerState();
}
}

class _RefershScrollerState extends State<RefershScroller>{
  ScrollController controller = new ScrollController(keepScrollOffset: true,initialScrollOffset: 0,);
  String loadingStr = '最后刷新时间:';
  String time ='--:--';
  double topMargin = 0;

@override
  void initState() {
    // TODO: implement initState
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
        children: <Widget>[

          Positioned(top: 20,child:Text(loadingStr + time,style: TextStyle(color: SkinConfig().titleTextColor()),textAlign: TextAlign.center,),),

          Container(padding: EdgeInsets.fromLTRB(0, topMargin, 0, 0),
                   child:Listener(
                     onPointerUp:onPointUp ,
                     child:  new ListView.builder(
                       itemCount: widget.count,
                       itemBuilder: widget.builder,
                       controller: controller,
                       physics: AlwaysScrollableScrollPhysics(),
                     )
                   ),
               )
        ],
      alignment: Alignment.center,
      );
  }
void onPointUp(PointerUpEvent event){


  if(controller.offset < -80 ){

    if( widget.refershing == false){
      print('refersh start');
       widget.refershing = true;
       widget.ref(stopRefersh);
       setState(() {

      double currentLocation =  controller.offset;
      controller.jumpTo(currentLocation + 60);
      this.topMargin = 60;

    });

    }
  }
}

void stopRefersh(){
  widget.refershing = false;
  setState(() {


    time = TimeOfDay.now().hour.toString() + ":" + TimeOfDay.now().minute.toString();
    this.topMargin = 0;
    controller.jumpTo(-60);

  });
}


}