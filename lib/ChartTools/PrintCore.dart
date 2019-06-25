import 'package:pjcj_flutter/common/PublicHeader.dart';

import 'KLineModel.dart';
import 'dart:ui'as ui;

String lineTypeCandle = 'candle';
String lineTypeAVG = 'avg';
String lineTypeMA1 = 'ma1';
String lineTypeMA2 = 'ma2';
String lineTypeMA3 = 'ma3';
String lineTypeVOL = 'vol';


class KLinePainter extends CustomPainter{


    List<KLineModel> dataList;
    double priceTop;
    double priceBottom;
    double volTop;

    //绘图单元数量(20 ~ 300)
    int drawUnitCount =30;


    Paint _paint = new Paint();
    Rect drawRect;

    @override
    KLinePainter({Key key,this.drawRect,this.dataList});


 @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint


    return true;
  }

 @override
 void paint(Canvas canvas, Size size) {
//   this.setDataList(this.dataList);
   this.setDataList();
   Rect rectTop = Rect.fromLTWH(drawRect.left, drawRect.top, drawRect.width, drawRect.height * 0.65);
   Rect rectBottom = Rect.fromLTWH(drawRect.left, drawRect.top + drawRect.height * 0.70, drawRect.width, drawRect.height * 0.3);

   _drawKLineUnit(rectTop, [lineTypeCandle,lineTypeAVG], canvas);

   _drawKLineUnit(rectBottom, [lineTypeVOL], canvas);
 }





//设置数据
 void setDataList(){
   double max = 9999999999999;

   this.priceTop = 0;
   this.priceBottom = max;
   this.volTop = 0;

   this.dataList = dataList;
   for(int i = 0 ;i < dataList.length;i++){
     KLineModel model = dataList[i];

     //找到最大最小
     if(model.top > priceTop){priceTop = model.top;}
     if(model.bottom < priceBottom){priceBottom = model.bottom;}


     if(model.vol > this.volTop){
       this.volTop = model.vol;
     }

   }
   if(dataList.length > 30){
   this.drawUnitCount = dataList.length;
   }

 }


void _drawKLineUnit(Rect rect,List lineTypes,Canvas canvas){


  //画外框
   _drawRoundRect(Colors.grey, 0.5, canvas,rect);


   if(this.dataList == null){
     return;
   }
      if(lineTypes.contains("candle")){

        _drawLinkCandleLine(this.dataList, canvas, rect);
        _drawText(Offset(rect.left, rect.top), 100, '最高:' + priceTop.toString() , Colors.red, 10, canvas);
        _drawText(Offset(rect.left, rect.top + 11), 100, '最低:' + priceBottom.toString() , Colors.green, 10, canvas);

      }

   if(lineTypes.contains("vol")){

    _drawVol(this.dataList, canvas, rect);

   }
   if(lineTypes.contains("avg")){

     _drawAVG(this.dataList, canvas, rect);

   }

}


  void _drawAVG(List<KLineModel> dataList,Canvas canvas,Rect rect){

   List<double> avgList = new List();
    for(int i = 0 ; i < dataList.length; i++) {
      KLineModel model = dataList[i];
      avgList.add(model.avg);
    }
    print(avgList);
    _drawLineContect(Colors.cyanAccent, 1, avgList, 0, canvas, rect, priceTop,priceBottom);

  }


void _drawVol(List<KLineModel> dataList,Canvas canvas,Rect rect){

  for(int i = 0 ; i < dataList.length; i++){

    KLineModel model = dataList[i];
    if(model.open > model.close){

    _drawVolLine(Colors.green, i, canvas, rect, model.vol, volTop);
    }else if(model.open < model.close){
      _drawVolLine(Colors.red,i, canvas, rect, model.vol, volTop);
    }else{
      _drawVolLine(Colors.grey, i, canvas, rect, model.vol, volTop);
    }

  }


  }

  void _drawVolLine(Color color,int count,Canvas canvas,Rect rect,double vol,double areaTop){

    double lineSpace = drawRect.width/drawUnitCount;

    _paint.color = color;
    _paint.strokeCap = StrokeCap.butt;
    _paint.isAntiAlias = true;
    _paint.strokeWidth = lineSpace  * 0.8;
    _paint.style = PaintingStyle.stroke;
    double unitHigh =  rect.height / areaTop ;
    canvas.drawLine(Offset(rect.left + lineSpace * (count + 0.5) , rect.bottom - vol * unitHigh), Offset(rect.left + lineSpace *  (count + 0.5), rect.bottom), _paint);

  }





void _drawLinkCandleLine(List<KLineModel> dataList,Canvas canvas,Rect rect){
  for(int i = 0 ; i < dataList.length; i++){

    KLineModel model = dataList[i];
    if(model.open > model.close){
      _drawCandleLine(Colors.green, i, canvas, rect, model.top, model.bottom, model.open, model.close,priceTop,priceBottom);
    }else if(model.open < model.close){
      _drawCandleLine(Colors.red, i, canvas, rect, model.top, model.bottom, model.open, model.close,priceTop,priceBottom);
    }else{
      _drawCandleLine(Colors.grey, i, canvas, rect, model.top, model.bottom, model.open, model.close,priceTop,priceBottom);
    }

  }
}



 void _drawCandleLine(Color color,int count,Canvas canvas,Rect rect,double top,double bottom,double open,double close,double areaTop,double areaBottom){


   double lineSpace = drawRect.width/drawUnitCount;

   _paint.color = color;
   _paint.strokeCap = StrokeCap.butt;
   _paint.isAntiAlias = true;
   _paint.strokeWidth = lineSpace  * 0.8;
   _paint.style = PaintingStyle.stroke;
   double unitHigh =  rect.height / (areaTop  - areaBottom);
   canvas.drawLine(Offset(rect.left + lineSpace * (count + 0.5) , rect.bottom - (open - areaBottom) * unitHigh), Offset(rect.left + lineSpace *  (count + 0.5), rect.bottom - (close - areaBottom) * unitHigh), _paint);
   _paint.strokeWidth = 1;
   canvas.drawLine(Offset(rect.left + lineSpace * (count + 0.5), rect.bottom - (top - areaBottom) * unitHigh), Offset(rect.left + lineSpace *  (count + 0.5), rect.bottom - (bottom - areaBottom) * unitHigh), _paint);
 }

 void _drawLineContect(Color color,double width,List<double> data,int startCount,Canvas canvas,Rect rect,double areaTop,double areaBottom){

   double lineSpace = drawRect.width/drawUnitCount;

   _paint.color = color;
   _paint.strokeCap = StrokeCap.round;
   _paint.isAntiAlias = true;
   _paint.strokeWidth = width;
   _paint.style = PaintingStyle.stroke;
   double unitHigh =  rect.height / (areaTop - areaBottom);
   for(int i = 0 ; i < data.length - 1;i++){
     double current = data[i] - areaBottom;
     double next = data[i + 1] - areaBottom;
     canvas.drawLine(Offset(rect.left + lineSpace * (i + startCount + 0.5), rect.bottom - current * unitHigh), Offset(rect.left + lineSpace * (i + 1 + startCount + 0.5), rect.bottom - next * unitHigh), _paint);
   }
 }


    void _drawRoundRect(Color color,double width,Canvas canvas,Rect rect){

      double lineSpace = drawRect.width/drawUnitCount;

      _paint.color = color;
      _paint.strokeCap = StrokeCap.butt;
      _paint.isAntiAlias = true;
      _paint.strokeWidth = width;
      _paint.style = PaintingStyle.stroke;
      canvas.drawRect(rect, _paint);

    }


void _drawText(Offset offset,double width,String text ,Color color ,double fontSize,Canvas canvas){

  ui.ParagraphBuilder pb = ui.ParagraphBuilder(ui.ParagraphStyle(
    textAlign: TextAlign.left,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: fontSize,
  ));
  pb.pushStyle(ui.TextStyle(color: color));
  pb.addText(text);
  ui.ParagraphConstraints pc = ui.ParagraphConstraints(width: width);
  ui.Paragraph paragraph = pb.build()..layout(pc);
  canvas.drawParagraph(paragraph, offset);

}


}
