import 'package:pjcj_flutter/common/PublicHeader.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';


class HardwareIO {


  factory HardwareIO() =>_getInstance();

  static HardwareIO get instance => _getInstance();

  static HardwareIO _instance;


  HardwareIO._internal() {


  }


  static HardwareIO _getInstance() {

    if (_instance == null) {

      _instance = new HardwareIO._internal();

    }

    return _instance;

  }

  static const platformReadUserdefault = const MethodChannel('samples.flutter.io/readUserDefaults');

  static const platformSetUserdefault = const MethodChannel('samples.flutter.io/setUserDefaults');

    Future<Null> setUserDefault(String key,String value,then(String result)) async {

    String result;

    try {

      result = await platformSetUserdefault.invokeMethod('setUserDefaults',{'key':key,'value':value});

    } on PlatformException catch (e) {

      result = "Failed to set.";

    }
     then(result);

    }


    Future<Null> readUserDefault(String key ,then(String value)) async {

    String result;

    try {

      result = await platformReadUserdefault.invokeMethod('readUserDefaults',{'key':key});

    } on PlatformException catch (e) {

      result = "Failed to read.";

    }

    then(result);

    }


    Future<Null> readAppVersion(  then(String value))async{

    PackageInfo info = await PackageInfo.fromPlatform();


    then(info.version);

    }


  }

