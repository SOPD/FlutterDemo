import 'package:pjcj_flutter/common/PublicHeader.dart';
import 'dart:async';
import 'package:sky_engine/_http/http.dart';
import 'dart:convert';


class BannerItem extends StatefulWidget{

  void Function(int int) didClickBanner;
  void Function(Function refAction) refershHandlr;

  @override
  BannerItem({Key key,this.didClickBanner,this.refershHandlr});

  _BannerItemState createState() => new _BannerItemState();

}
class _BannerItemState extends State<BannerItem> with AutomaticKeepAliveClientMixin{
  @override
   bool get wantKeepAlive => true;

  //数据源
  List<Widget> imageList = [new Container()];
  bool onceFlag = false;
  PageController _pageController = new PageController(initialPage: 1,keepPage: true,viewportFraction: 1.0);
  int _cur = 0;
  Timer _timer;


  @override
  void initState() {
    // TODO: implement initState
    print('banner init');
    widget.refershHandlr((){
       requestData();
    });

  requestData();

    _pageController.addListener((){

      if( _pageController.offset <= 0 ){

        _pageController.jumpToPage(1);

        changePage(0);

      }
      if( _pageController.offset >= 2 * MediaQuery.of(context).size.width ){

        _pageController.jumpToPage(1);

        changePage(2);
      }
    });

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer){

      _pageController.animateToPage(2, duration: const Duration(seconds: 2), curve: Curves.fastOutSlowIn);

    });


    super.initState();
  }



 Future<Null>requestData()async{

    print('banner request');
    HttpClient httpClient = new HttpClient();

    Uri uri=Uri(scheme: "http", host: URLbaseWWW,path:PATHBanner , queryParameters: {
    'id' : 'NEWS_POP'
    });
    HttpClientRequest request = await httpClient.getUrl(uri);

    HttpClientResponse response = await request.close();

    String responseBody = await response.transform(utf8.decoder).join();

    Map result = json.decode(responseBody);

    List dataList = result['Data'];

    setState(() {
      for(var i = 0 ;i < dataList.length;i++){

        Map dict = dataList[i];
        String path = 'http://' + URLbaseWWW + dict['BannerImage'];
        print(path);
        imageList.add(new Image.network(path,height: MediaQuery.of(context).size.width / 16 * 9 ,width:MediaQuery.of(context).size.width,fit: BoxFit.fill,));
      }
     while(imageList.length > dataList.length){

        imageList.removeAt(0);
      }
    });
 }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return new Container(
      height: 150,
      color:SkinConfig.instance.randomColor(),
      child:getPageView(),
      alignment: Alignment.center,

    );
      

  }

  Widget getPageView(){
    return PageView(

      children: <Widget> [
        new Container(color: SkinConfig.instance.mainBGColor(),alignment: Alignment.center,child: imageList[preNum()] ,padding: EdgeInsets.all(0),),
        new Container(color: SkinConfig.instance.mainBGColor(),alignment: Alignment.center,
          child: new FlatButton(onPressed: btnTouched,child: imageList[_cur],padding: EdgeInsets.all(0),),
          padding: EdgeInsets.all(0),
        ),
        new Container(color: SkinConfig.instance.mainBGColor(),alignment: Alignment.center,child: imageList[nextNum()] ,padding: EdgeInsets.all(0),),
      ],
      scrollDirection: Axis.horizontal,
//      onPageChanged: pageChanged,
      controller: _pageController,
    );
  }

  void btnTouched(){

//    print('btn touched ' + _cur.toString());

    widget.didClickBanner(_cur);

  }
 void changePage(int pageCount){
    //向后滚动
    setState(() {
      if(pageCount == 2){

        _cur++;

        if(_cur == imageList.length){
          _cur = 0;
        }
      }
      //向前滚动
      if(pageCount == 0){
        _cur--;
        if(_cur == -1){
          _cur = imageList.length - 1;
        }
        
      }


    });
  }
  int preNum(){

    return _cur - 1>=0?_cur-1:imageList.length - 1;

  }

  int nextNum(){

    return _cur + 1 <imageList.length ?_cur + 1:0;

  }

  @override
  void dispose() {
    _timer.cancel();


    // TODO: implement dispose
    super.dispose();
  }

}