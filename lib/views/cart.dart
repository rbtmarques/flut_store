import 'package:flut_store/utils/resources.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget{
  @override
  CartState createState() => CartState();
}
class CartState extends State<Cart>{
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Icon(Icons.shopping_cart,color: Colors.white,),Text(" Cart")],),
            actions: <Widget>[new PopupMenuButton(
              elevation: 10.0,
              padding: new EdgeInsets.all(0.0),
              tooltip:"Settings",
              icon: new Icon(Icons.more_vert) ,
              onSelected: (dynamic value){
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem>[
                new PopupMenuItem(
                    child: new Text('Clear Cart')
                ),
              ],
            ),],
      ),
      body: _nonEmptyCart()
    );

  }
  Widget _nonEmptyCart(){
    var deviceSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: FloatingActionButton(onPressed:(){},backgroundColor: Colors.blueGrey[900].withOpacity(0.3),child: new Icon(Icons.shopping_cart,color: Colors.green[400],size: 45.0,)),
            ),
            Text("My Cart: ",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
          ],
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),gradient: LinearGradient(begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.5, 0.7, 0.8,0.9],
            colors: [
              Colors.blueGrey[500],
              Colors.blueGrey[300],
              Colors.blueGrey[200],
              Colors.blueGrey[100],
            ],)),
          margin: EdgeInsets.all(10.0),
          height: deviceSize.height/1.57,
          width: deviceSize.width,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              _productTile("Iphone X"),
              _productTile("gIONEE"),
              _productTile("Redmi"),
              _productTile("Samsung Galaxy S9"),
              _productTile("Samsung Note 9"),
              _productTile("Galaxy Tab"),
              _productTile("Micromax"),
              _productTile("Nokia N8"),
              _productTile("Moto G"),
            ],
          ),
        ),
        Container(
            height: 60.0,
            width: deviceSize.width,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                gradient: LinearGradient(begin: AlignmentDirectional.bottomCenter,end: AlignmentDirectional.topCenter,colors: [Colors.yellow[600],Colors.yellow[500],Colors.yellow[200]])
            ),
            child: FlatButton(child: Text("Proceed to Checkout",style: TextStyle(fontSize: 18.0),),onPressed: (){},))
      ],
    );
  }
  Widget _productTile(String prodName){
    return new Container(
      margin: EdgeInsets.all(2.0),
      color: Colors.white.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset("lib/assets/img.png",height: 80.0,width: 60.0,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(prodName,style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w500),),
              ),
              Text("£100",style: TextStyle(fontSize: 15.0),),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(onPressed: (){print('+');},icon: Icon(Icons.add_circle_outline),),
                  Text("2"),
                  IconButton(onPressed: (){print('-');},icon: Icon(Icons.remove_circle_outline),),
                ],
              )
            ],
          ),
          new IconButton(icon: Icon(Icons.close), onPressed: (){})
        ],
      ),
    );
  }
  Widget _emptyCart(){
    var deviceSize = MediaQuery.of(context).size;
    return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FloatingActionButton(onPressed:(){},backgroundColor: Colors.blueGrey[900].withOpacity(0.3),child: new Icon(Icons.shopping_cart,color: Colors.red,size: 45.0,)),
                  new Text("Your Cart is Empty!",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                  new Text("add new items..??",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new FlatButton(
                        onPressed: (){},
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width: 2.0,color: Colors.greenAccent)),
                        child: Text("Start Shopping...",style: TextStyle(color:Colors.white,fontSize: 16.0,fontWeight: FontWeight.w500))),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blueGrey[500],
            child: dealsOfDayGrid("Continue shopping", deviceSize),
          )
        ]
    );
  }

}