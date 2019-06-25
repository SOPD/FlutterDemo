import 'package:pjcj_flutter/common/PublicHeader.dart';
import 'KLineModel.dart';

import 'PrintCore.dart';
class KLineWidget extends StatefulWidget{

    Rect drawRect ;

    @override
    KLineWidget({Key key,this.drawRect});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _kLineWidgetState();
  }

}
class _kLineWidgetState extends State<KLineWidget>{

  KLinePainter painter;

  List<KLineModel> datalist =[
    new KLineModel(top: 2862.33,bottom: 2822.19,open: 2862.33,close: 2827.8,vol: 1.77),
    new KLineModel(top: 2927.43,bottom: 2854.07,open: 2854.07,close: 2924.72,vol: 2.61),
    new KLineModel(top: 2924.70,bottom: 2903.88,open: 2917.22,close: 2909.38,vol: 2.4),
    new KLineModel(top: 2918.42,bottom: 2885.92,open: 2905.29,close: 2910.74,vol: 2.13),
    new KLineModel(top: 2924.32,bottom: 2879.66,open: 2913.00,close: 2881.97,vol: 2.15),
    new KLineModel(top: 2902.48,bottom: 2877.39,open: 2880.42,close: 2887.62,vol: 1.54),
    new KLineModel(top: 2898.33,bottom: 2874.31,open: 2891.09,close: 2890.16,vol: 1.48),
    new KLineModel(top: 2953.34,bottom: 2916.21,open: 2944.12,close: 2917.80,vol: 2.31),
    new KLineModel(top: 2997.39,bottom: 2915.09,open: 2917.33,close: 2987.12,vol: 2.91),
    new KLineModel(top: 2862.33,bottom: 2822.19,open: 2862.33,close: 2827.8,vol: 1.77),
    new KLineModel(top: 2927.43,bottom: 2854.07,open: 2854.07,close: 2924.72,vol: 2.61),
    new KLineModel(top: 2924.70,bottom: 2903.88,open: 2917.22,close: 2909.38,vol: 2.4),
    new KLineModel(top: 2918.42,bottom: 2885.92,open: 2905.29,close: 2910.74,vol: 2.13),
    new KLineModel(top: 2924.32,bottom: 2879.66,open: 2913.00,close: 2881.97,vol: 2.15),
    new KLineModel(top: 2902.48,bottom: 2877.39,open: 2880.42,close: 2887.62,vol: 1.54),
    new KLineModel(top: 2898.33,bottom: 2874.31,open: 2891.09,close: 2890.16,vol: 1.48),
    new KLineModel(top: 2953.34,bottom: 2916.21,open: 2944.12,close: 2917.80,vol: 2.31),
    new KLineModel(top: 2997.39,bottom: 2915.09,open: 2917.33,close: 2987.12,vol: 2.91),
    new KLineModel(top: 2862.33,bottom: 2822.19,open: 2862.33,close: 2827.8,vol: 1.77),
    new KLineModel(top: 2927.43,bottom: 2854.07,open: 2854.07,close: 2924.72,vol: 2.61),
    new KLineModel(top: 2924.70,bottom: 2903.88,open: 2917.22,close: 2909.38,vol: 2.4),
    new KLineModel(top: 2918.42,bottom: 2885.92,open: 2905.29,close: 2910.74,vol: 2.13),
    new KLineModel(top: 2924.32,bottom: 2879.66,open: 2913.00,close: 2881.97,vol: 2.15),
    new KLineModel(top: 2902.48,bottom: 2877.39,open: 2880.42,close: 2887.62,vol: 1.54),
    new KLineModel(top: 2898.33,bottom: 2874.31,open: 2891.09,close: 2890.16,vol: 1.48),
    new KLineModel(top: 2953.34,bottom: 2916.21,open: 2944.12,close: 2917.80,vol: 2.31),
    new KLineModel(top: 2997.39,bottom: 2915.09,open: 2917.33,close: 2987.12,vol: 2.91),
    new KLineModel(top: 2862.33,bottom: 2822.19,open: 2862.33,close: 2827.8,vol: 1.77),
    new KLineModel(top: 2927.43,bottom: 2854.07,open: 2854.07,close: 2924.72,vol: 2.61),
    new KLineModel(top: 2924.70,bottom: 2903.88,open: 2917.22,close: 2909.38,vol: 2.4),
    new KLineModel(top: 2918.42,bottom: 2885.92,open: 2905.29,close: 2910.74,vol: 2.13),
    new KLineModel(top: 2924.32,bottom: 2879.66,open: 2913.00,close: 2881.97,vol: 2.15),
    new KLineModel(top: 2902.48,bottom: 2877.39,open: 2880.42,close: 2887.62,vol: 1.54),
    new KLineModel(top: 2898.33,bottom: 2874.31,open: 2891.09,close: 2890.16,vol: 1.48),
    new KLineModel(top: 2953.34,bottom: 2916.21,open: 2944.12,close: 2917.80,vol: 2.31),
    new KLineModel(top: 2997.39,bottom: 2915.09,open: 2917.33,close: 2987.12,vol: 2.91),
    new KLineModel(top: 2862.33,bottom: 2822.19,open: 2862.33,close: 2827.8,vol: 1.77),
    new KLineModel(top: 2927.43,bottom: 2854.07,open: 2854.07,close: 2924.72,vol: 2.61),
    new KLineModel(top: 2924.70,bottom: 2903.88,open: 2917.22,close: 2909.38,vol: 2.4),
    new KLineModel(top: 2918.42,bottom: 2885.92,open: 2905.29,close: 2910.74,vol: 2.13),
    new KLineModel(top: 2924.32,bottom: 2879.66,open: 2913.00,close: 2881.97,vol: 2.15),
    new KLineModel(top: 2902.48,bottom: 2877.39,open: 2880.42,close: 2887.62,vol: 1.54),
    new KLineModel(top: 2898.33,bottom: 2874.31,open: 2891.09,close: 2890.16,vol: 1.48),
    new KLineModel(top: 2953.34,bottom: 2916.21,open: 2944.12,close: 2917.80,vol: 2.31),
    new KLineModel(top: 2997.39,bottom: 2915.09,open: 2917.33,close: 2987.12,vol: 2.91),
    new KLineModel(top: 2862.33,bottom: 2822.19,open: 2862.33,close: 2827.8,vol: 1.77),
    new KLineModel(top: 2927.43,bottom: 2854.07,open: 2854.07,close: 2924.72,vol: 2.61),
    new KLineModel(top: 2924.70,bottom: 2903.88,open: 2917.22,close: 2909.38,vol: 2.4),
    new KLineModel(top: 2918.42,bottom: 2885.92,open: 2905.29,close: 2910.74,vol: 2.13),
    new KLineModel(top: 2924.32,bottom: 2879.66,open: 2913.00,close: 2881.97,vol: 2.15),
    new KLineModel(top: 2902.48,bottom: 2877.39,open: 2880.42,close: 2887.62,vol: 1.54),
    new KLineModel(top: 2898.33,bottom: 2874.31,open: 2891.09,close: 2890.16,vol: 1.48),
    new KLineModel(top: 2953.34,bottom: 2916.21,open: 2944.12,close: 2917.80,vol: 2.31),
    new KLineModel(top: 2997.39,bottom: 2915.09,open: 2917.33,close: 2987.12,vol: 2.91),
    new KLineModel(top: 2898.33,bottom: 2874.31,open: 2891.09,close: 2890.16,vol: 1.48),
    new KLineModel(top: 2953.34,bottom: 2916.21,open: 2944.12,close: 2917.80,vol: 2.31),
    new KLineModel(top: 2997.39,bottom: 2915.09,open: 2917.33,close: 2987.12,vol: 2.91),
    new KLineModel(top: 2862.33,bottom: 2822.19,open: 2862.33,close: 2827.8,vol: 1.77),
    new KLineModel(top: 2927.43,bottom: 2854.07,open: 2854.07,close: 2924.72,vol: 2.61),
    new KLineModel(top: 2924.70,bottom: 2903.88,open: 2917.22,close: 2909.38,vol: 2.4),
    new KLineModel(top: 2918.42,bottom: 2885.92,open: 2905.29,close: 2910.74,vol: 2.13),
    new KLineModel(top: 2924.32,bottom: 2879.66,open: 2913.00,close: 2881.97,vol: 2.15),
    new KLineModel(top: 2902.48,bottom: 2877.39,open: 2880.42,close: 2887.62,vol: 1.54),
    new KLineModel(top: 2898.33,bottom: 2874.31,open: 2891.09,close: 2890.16,vol: 1.48),
    new KLineModel(top: 2953.34,bottom: 2916.21,open: 2944.12,close: 2917.80,vol: 2.31),
    new KLineModel(top: 2997.39,bottom: 2915.09,open: 2917.33,close: 2987.12,vol: 2.91),
    new KLineModel(top: 2862.33,bottom: 2822.19,open: 2862.33,close: 2827.8,vol: 1.77),
    new KLineModel(top: 2927.43,bottom: 2854.07,open: 2854.07,close: 2924.72,vol: 2.61),
    new KLineModel(top: 2924.70,bottom: 2903.88,open: 2917.22,close: 2909.38,vol: 2.4),
    new KLineModel(top: 2918.42,bottom: 2885.92,open: 2905.29,close: 2910.74,vol: 2.13),
    new KLineModel(top: 2924.32,bottom: 2879.66,open: 2913.00,close: 2881.97,vol: 2.15),
    new KLineModel(top: 2902.48,bottom: 2877.39,open: 2880.42,close: 2887.62,vol: 1.54),
    new KLineModel(top: 2898.33,bottom: 2874.31,open: 2891.09,close: 2890.16,vol: 1.48),
    new KLineModel(top: 2953.34,bottom: 2916.21,open: 2944.12,close: 2917.80,vol: 2.31),
    new KLineModel(top: 2997.39,bottom: 2915.09,open: 2917.33,close: 2987.12,vol: 2.91),

  ];
  List<KLineModel> showList = [];

//start> 0  start < datalist.length - count;
  int start  = 0;
  int count = 30;


  double downPoint;

  int moveTemp;



  void calcuateAVG(){

    for(int i = 0 ; i < datalist.length;i++){
      KLineModel model = datalist[i];
      model.avg = (model.top + model.bottom)/2;
    }
  }




@override
  void initState() {

    calcuateAVG();
    if( datalist.length - count > 0){
      start = datalist.length - count;
    }
    showList = datalist.sublist(start,start + count);


    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Listener(
      child: new Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: new CustomPaint(painter:  new KLinePainter(drawRect:widget.drawRect,dataList: this.showList)),
        color:  SkinConfig().secBGColor(),
      ),
      onPointerMove: onTouchsMove,
      onPointerDown: onTouchsStart,
      onPointerUp: onTouchsEnd,
    );
  }
  void onTouchsStart(PointerDownEvent event){

downPoint = event.position.dx;
  }


  void onTouchsMove(PointerMoveEvent event){

     double moves = downPoint - event.position.dx;

     int moveCount =(moves/20).toInt();

     if(start + moveCount < 0){
       moveTemp = -start;
     }else if(start + moveCount + count > datalist.length){

       moveTemp = datalist.length - count - start;
     }else{

       moveTemp = moveCount;
     }

     setState(() {
       showList = datalist.sublist(start + moveTemp,start + moveTemp + count);
     });

  }
  void onTouchsEnd(PointerUpEvent event){
    start = start + moveTemp;
    moveTemp = 0;

  }



}