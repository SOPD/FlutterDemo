import 'package:pjcj_flutter/common/PublicHeader.dart';
import 'dart:typed_data';

class KLineModel {

    String code;
    double top;
    double bottom;
    double open;
    double close;
    double last;
    double avg;
    double vol;
    double ma1;
    double ma2;



    @override
    KLineModel({Key key,this.code
                       ,this.top
                       ,this.bottom
                       ,this.open
                       ,this.close
                       ,this.last
                       ,this.avg
                       ,this.vol
                       ,this.ma1
                       ,this.ma2});


}