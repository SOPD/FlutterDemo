
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
Map resultMap;

readLanguageFile(String type){
    _readData().then((Map data) {
        resultMap = data;
    });
}


    String textOf(String textData){
        if(resultMap == null){
            return textData;
        }
        if(resultMap.containsKey(textData)){
            return resultMap[textData];
        }else{
            return textData;
        }


}
Future<Map> _readData() async{

    String str = await rootBundle.loadString("assets/files/LanguageList_En");
    Map result = json.decode(str);
    return result;

}