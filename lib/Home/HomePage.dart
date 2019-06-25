import 'package:pjcj_flutter/common/PublicHeader.dart';
import 'package:pjcj_flutter/Home/HomeItems/BannerItem.dart';
import 'package:pjcj_flutter/ChartTools/PrintCore.dart';
import 'package:pjcj_flutter/Home/HomeItems/RefershList.dart';
import 'package:pjcj_flutter/ChartTools/KlineWidget.dart';
import 'package:pjcj_flutter/Home/HomeItems/NewsItem.dart';
import 'dart:io';
import 'dart:convert';
class HomePage extends StatefulWidget{


  _HomepPageState createState() => new _HomepPageState();
}
class _HomepPageState extends State<HomePage>{


Function bannerrefAction;
String title = 'title';
Function changeSkinFunction;
List artworkList = new List();

  @override
  void initState() {
    print('home init');
    // TODO: implement initState
    changeSkinFunction =  (){
      setState(() {
      });
    };

    reqArtowrk((String result){});
    SkinConfig().regChangeAction(changeSkinFunction);
    super.initState();
  }


  Future reqArtowrk(then(String result))async{

    HttpClient httpClient = new HttpClient();

    Uri uri=Uri(scheme: "http", host: URLbaseAPP,path:PATHArtwork , queryParameters: {
      'pageSize' : '10'
    });
    HttpClientRequest request = await httpClient.getUrl(uri);

    HttpClientResponse response = await request.close();

    String responseBody = await response.transform(utf8.decoder).join();

    List resultList = json.decode(responseBody);
    List temp = new List();

    for(int i = 0;i < resultList.length;i++){
      Map res = resultList[i];

      Map model ={
        'title':res['ArticleSummary'],
        'imgUrl':'http://' +URLbaseAPP + res['Logo'],
        'Url':URLbaseAPP + res['Url']
      };
      temp.add(model);

    }
    setState(() {
      artworkList = temp;
    });
    then(responseBody);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor: SkinConfig().mainBGColor(),
        appBar: new AppBar(
            backgroundColor:SkinConfig.instance.mainColor(),
            title: new Text('home'),
            leading: Builder(builder: (BuildContext context){
              return IconButton(icon:new Icon(Icons.swap_horiz), onPressed: onPress);
            }
            )
        ),
      body:new RefershScroller(
        count:2 + artworkList.length ,
        builder: (context, index) {

          if(index == 0){
            return  new BannerItem(refershHandlr: bannerRefHandlr
           ,didClickBanner: (int index){
               print('value1');
              },);
           }

          if(index  == 1 ){
            return new KLineWidget(drawRect: Rect.fromLTWH(
                  10,
                  10,
                  MediaQuery.of(context).size.width - 20,
                  180),);


          }

          return new NewsItem(title:artworkList[index - 2]['title'],imageUrl:artworkList[index - 2]['imgUrl'] ,);
        },
        ref: onHeaderRef,
      )
    );

  }


  void bannerRefHandlr(Function refAction){
      bannerrefAction = refAction;
  }
  void onHeaderRef(Function stopRefersh){

     this.reqArtowrk((String result){

     });
     Future.delayed(Duration(seconds: 2),(){
       stopRefersh();
     });
}
  void onPress(){
    //切换皮肤主题
    SkinConfig.instance.switchModel();
  }


  @override
  void dispose() {
    // TODO: implement dispose
   SkinConfig().unRegChangeAction(changeSkinFunction);
    super.dispose();
  }

}

class MyBehavior  extends ScrollBehavior{
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if(Platform.isAndroid||Platform.isFuchsia){
      return child;
    }else{
      return super.buildViewportChrome(context,child,axisDirection);
    }
  }
}
