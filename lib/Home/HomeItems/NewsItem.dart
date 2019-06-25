import 'package:pjcj_flutter/common/PublicHeader.dart';
class NewsItem extends StatelessWidget{


final String title;
final String imageUrl;
final String DestUrl;

  @override
  NewsItem({Key key,this.title,this.imageUrl,this.DestUrl});

 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        color: SkinConfig().secBGColor(),
        onPressed: btnTouched,
        padding: EdgeInsets.only(left: 5,top: 5),
        child:new Row(
          children: <Widget>[
            new Image.network(imageUrl,height: 80 ,width:115,fit: BoxFit.fill,),
            new Padding(padding: EdgeInsets.only(left: 10)),
            new Container(width:MediaQuery.of(context).size.width - 145, height:90 ,
              child: Text(title,maxLines: 2,style: TextStyle(fontSize: 15,color:SkinConfig().titleTextColor() ),softWrap: true,overflow: TextOverflow.ellipsis,),)
          ],
          crossAxisAlignment:  CrossAxisAlignment.start,
        )
        ,),
    );


  }

  void btnTouched(){


  }
}

