import 'package:flut_store/CarouselDemo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FlutStoreHome extends StatefulWidget {
  @override
  _FlutStoreState createState() => new _FlutStoreState();
}

class _FlutStoreState extends State<FlutStoreHome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,
        title: new Text('FlutStore', style: new TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontFamily: 'Billabong',
            fontSize: 29.0)),
        //App title with left padding

        iconTheme: new IconThemeData(color: Colors.white),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.notifications), onPressed: () {
            Navigator.of(context).pushNamed("/electronics");
          }),
          new IconButton(
              icon: new Icon(Icons.add_shopping_cart), onPressed: () {
            Navigator.of(context).pushNamed("/notifications");
          }),

        ],
      ), //AppBar
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey[900]),
              accountName: new Text('Pranav Kapoor', style: new TextStyle(
                  fontSize: 18.0, fontWeight: FontWeight.bold)),
              accountEmail: new Text('pranavkapoorr@gmail.com',
                  style: new TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.normal)),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.black45,
                child: new Icon(
                  Icons.account_circle, size: 50.0, color: Colors.white,),
              ), //Circle Avatar
            ), //UserAccount drawer header parent box
            new Divider(
                height: defaultTargetPlatform == TargetPlatform.iOS ? 5.0 : 0.0,
                color: defaultTargetPlatform == TargetPlatform.iOS
                    ? Colors.grey
                    : Colors.white), //
            new ListTile(
              title: new Text('Electronics'),
              leading: new Icon(Icons.phone_iphone),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/a");
              },
            ), //List Tile 1
            new ListTile(
              title: new Text('Lifestyle'),
              leading: new Icon(Icons.face),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/b");
              },
            ), //List Tile 2
            new ListTile(
              title: new Text('TVs and Appliances'),
              leading: new Icon(Icons.home),
            ), //List Tile 3
            new ListTile(
              title: new Text('Sports, Books & More'),
              leading: new Icon(Icons.store),
            ), //List 4
            new ListTile(
              title: new Text('Offer Zone'),
              leading: new Icon(Icons.local_offer),
            ), //List Tile 5
            new ListTile(
              title: new Text('My Cart'),
              leading: new Icon(Icons.shopping_cart),
            ), //List Tile 6
            new ListTile(
              title: new Text('My Wishlist'),
              leading: new Icon(Icons.favorite),
            ), //List Tile 7
            new ListTile(
              title: new Text('My Orders'),
              leading: new Icon(Icons.account_balance_wallet),
            ), //List Tile 8
            new ListTile(
              title: new Text('My Account'),
              leading: new Icon(Icons.account_box),
            ), //List Tile 9
            new ListTile(
              title: new Text('About us'),
              leading: new Icon(Icons.info),
            ), //List Tile 10
          ],
        ), //parent ListView
      ), //parent Drawer
      body: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _searchBar(context),
        new Flexible(
          child: _feed(context),
        ),
      ],
    )
    ); //Scaffold
  }
  Widget _searchBar(BuildContext context){
    return new Container(color: Colors.blueGrey[900],
        alignment: Alignment.center,
        height: 55.0,
        child: new Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
            ),
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10.0),
            child: new FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/notifications");
              },
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Icon(Icons.search, size: 20.0),
                  new Text(' What are you looking for?',
                    style: new TextStyle(color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _feed(BuildContext context) {
    var deviceSize = MediaQuery
        .of(context)
        .size;
    return new ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) =>
        index == 0
            ? _categories(deviceSize)
            : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Flexible(child: new Container(height: 170.0, child: new CarouselDemo(), color: Colors.white)),
              new Flexible(child: new Container(height: 300.0,
                  color: Colors.blueGrey[600],
                  child: _dealsOfDay(deviceSize),
                  margin: new EdgeInsets.only(top: 8.0))),

              new Flexible(child: new Container(height: 250.0,
                  color: Colors.blueGrey[600],
                  child: _singlePromotion(deviceSize),
                  margin: new EdgeInsets.only(top: 8.0))),

              new Flexible(child: new Container(height: 300.0,
                  color: Colors.blueGrey[600],
                  child: _dealsOfDay(deviceSize),
                  margin: new EdgeInsets.only(top: 8.0))),

            ]
        )
    );
  }

  Widget _categories(Size deviceSize) {
    return new Container(
      margin: new EdgeInsets.only(bottom: 10.0),
      alignment: Alignment.center,
      width: deviceSize.width,
      color: Colors.blueGrey[600],
      height: deviceSize.height * 0.08,
      child: new ListView(
        shrinkWrap: true,
        padding: new EdgeInsets.only(top: 10.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            height: 90.0,
            color: Colors.transparent,
            alignment: Alignment.center,
            child: new FlatButton(onPressed: () {

            }, child: new Column(
              children: <Widget>[
                new Icon(Icons.local_offer, color: Colors.white),
                new Padding(padding: new EdgeInsets.only(bottom: 2.0)),
                new Text("Offers", textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white)),
              ],
            )),
          ),
          new Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            child: new FlatButton(onPressed: () {

            }, child: new Column(
              children: <Widget>[
                new Icon(Icons.phone_iphone, color: Colors.white),
                new Padding(padding: new EdgeInsets.only(bottom: 2.0)),
                new Text("Mobiles", textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white)),
              ],
            )),
          ),
          new Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            child: new FlatButton(onPressed: () {

            }, child: new Column(
              children: <Widget>[
                new Icon(Icons.laptop_mac, color: Colors.white),
                new Padding(padding: new EdgeInsets.only(bottom: 2.0)),
                new Text("Laptops", textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white)),
              ],
            )),
          ),
          new Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            child: new FlatButton(onPressed: () {

            }, child: new Column(
              children: <Widget>[
                new Icon(Icons.more, color: Colors.white),
                new Padding(padding: new EdgeInsets.only(bottom: 2.0)),
                new Text("More", textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white)),
              ],
            )),
          ),
        ],
      ),
    );
  }
  Widget _singlePromotion(Size deviceSize){
    return new Container(
      width: deviceSize.width,
      child: new FlatButton(
        onPressed: () {},
        child:  new Container(width: deviceSize.width, height: 230.0, color: Colors.white,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(padding: new EdgeInsets.only(top: 1.0, bottom: 6.0),
                  child: new Row(
                    children: [
                      new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Container(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, left: 10.0),
                                child: new Text(
                                    "Premium Sports Shoes", textAlign: TextAlign.start,
                                    style: new TextStyle(color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal))
                            ),
                            new Container(padding: const EdgeInsets.only(
                                bottom: 8.0, left: 10.0),
                                child: new Text(
                                    "Up to 60% Off", textAlign: TextAlign.start,
                                    style: new TextStyle(color: Colors.green,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ), //Expanded ends
                      new Padding(
                        padding: new EdgeInsets.only(bottom: 8.0, right: 2.0),
                        child: new Image.asset("lib/assets/sports shoes.png", height: 100.0,
                            fit: BoxFit.fitWidth),
                      ),
                    ],
                  )
              ), //row ends (text and image)
            ],
          ), //Column ends
        ), //white container ends
      ), //flat button ends
    );
  }
  Widget _dealsOfDay(Size deviceSize){
    return new Container(
      height: 300.0,
      width: deviceSize.width,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 1.0, bottom: 6.0),
              child: new Row(
                children: [
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Container(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 10.0),
                            child: new Text(
                                "New Launches", textAlign: TextAlign.start,
                                style: new TextStyle(color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))
                        ),
                      ],
                    ),
                  ),
                  new Padding(
                      padding: new EdgeInsets.only(bottom: 8.0, right: 10.0),
                      child: new RaisedButton(color: Colors.white,
                        onPressed: () {},
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(4.0)),
                        textColor: Colors.black,
                        child: new Text("View All"),
                      )
                  ),
                ],
              )), //row ends (text and button)

          new Container(
            color: Colors.white, width: deviceSize.width, height: 220.0,
            child: new ListView (
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[

                //list item 1
                new Container(width: 130.0,
                  child: new FlatButton(
                      onPressed: () {},
                      padding: new EdgeInsets.only(top: 10.0),
                      child: new Column(
                        children: <Widget>[
                          new Image.asset(
                              "lib/assets/honor 10.png", height: 100.0,
                              fit: BoxFit.fitWidth),
                          new Padding(
                              padding: new EdgeInsets.only(bottom: 4.0)),
                          new Text("Honor 10", textAlign: TextAlign.center,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 13.0)),
                          new Padding(
                              padding: new EdgeInsets.only(bottom: 4.0)),
                          new Text("6 GB RAM", textAlign: TextAlign.center,
                              style: new TextStyle(
                                  color: Colors.green, fontSize: 13.0)),
                        ],
                      )),
                ), //list item 1

                //list item 2
                new Container(width: 130.0, child:
                new FlatButton(
                    onPressed: () {},
                    padding: new EdgeInsets.only(top: 10.0),
                    child: new Column(
                      children: <Widget>[
                        new Image.asset(
                            "lib/assets/iphone 6s.png", height: 100.0,
                            fit: BoxFit.fitWidth),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                        new Text(
                            "iPhone 6s (32 GB)", textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.black, fontSize: 13.0)),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                        new Text(
                            "12 MP | 5 MP Camera", textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.green, fontSize: 13.0)),
                      ],
                    )),
                ), //list item 2

                //list item 3
                new Container(width: 130.0, child:
                new FlatButton(
                    onPressed: () {},
                    padding: new EdgeInsets.only(top: 10.0),
                    child: new Column(
                      children: <Widget>[
                        new Image.asset(
                            "lib/assets/iphone 8.png", height: 100.0,
                            fit: BoxFit.fitWidth),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                        new Text(
                            "iPhone 8 (256 GB)", textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.black, fontSize: 13.0)),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                        new Text(
                            "12 MP | 7 MP Camera", textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.green, fontSize: 13.0)),
                      ],
                    )),
                ), //list item 3

                //list item 4
                new Container(width: 130.0, child:
                new FlatButton(
                    onPressed: () {},
                    padding: new EdgeInsets.only(top: 10.0),
                    child: new Column(
                      children: <Widget>[
                        new Image.asset("lib/assets/oppo f7.png", height: 100.0,
                            fit: BoxFit.fitWidth),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                        new Text(
                            "OPPO F7(Red, 64 GB)", textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.black, fontSize: 13.0)),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                        new Text(
                            "16 MP | 25 MP Camera", textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.green, fontSize: 13.0)),
                      ],
                    )),
                ), //list item 4
              ],
            ),
          )
        ],
      ), //parent column
    );
  }
}

