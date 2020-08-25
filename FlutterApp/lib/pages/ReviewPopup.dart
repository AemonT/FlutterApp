import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///aemon comments zetten
class ReviewPopup extends StatefulWidget {
  int id;
  ReviewPopup({Key key, this.id}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return RealWorldState();
  }
}

///aemon comments zetten
class RealWorldState extends State<ReviewPopup> {
  bool _buttonEnabled = false;
  int _sterRating = 0;
  var _1ster = false;
  var _2ster = false;
  var _3ster = false;
  var _4ster = false;
  var _5ster = false;
  var foo = false;
  var _onPressed;

  String opmerkingen = " ";
  String naam = " ";
  @override
  Widget build(BuildContext context) {
    if (_sterRating != 0 && (naam != null || naam != " ")) {
      _buttonEnabled = true;
    } else {
      _buttonEnabled = false;
    }
    if (_buttonEnabled == true) {
      _onPressed = () {
        print("Tap");
        setState(() {});
      };
    } else if (_buttonEnabled == false) {
      _onPressed = null;
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ReviewPage'),
      ),
      body: new SingleChildScrollView(
          child: new Center(
              child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            maxLength: 20,
            decoration: new InputDecoration(hintText: 'Naam'),
            onChanged: (text) {
              naam = text;
            },
          ),
          new TextField(
            maxLength: 150,
            decoration: new InputDecoration(hintText: 'Opmerkingen'),
            onChanged: (text) {
              opmerkingen = text;
            },
          ),
          new BottomAppBar(
              elevation: 0.0,
              color: Colors.white10,
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                      icon: new Icon(Icons.stars),
                      iconSize: 35.0,
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.bottomRight,
                      color: _1ster ? Colors.blue : Colors.black,
                      onPressed: () {
                        print("1 ster");
                        setState(() {
                          _sterRating = 1;
                          if (_sterRating == 1 && foo == false) {
                            _1ster = true;
                            _2ster = false;
                            _3ster = false;
                            _4ster = false;
                            _5ster = false;
                            foo = true;
                          } else if (_sterRating == 1 && foo == true) {
                            _1ster = false;
                            foo = false;
                            _sterRating = 0;
                          }
                        });
                      }),
                  new IconButton(
                      icon: new Icon(Icons.stars),
                      iconSize: 35.0,
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.bottomRight,
                      color: _2ster ? Colors.blue : Colors.black,
                      onPressed: () {
                        print("2 ster");
                        setState(() {
                          _sterRating = 2;
                          if (_sterRating == 2) {
                            _1ster = true;
                            _2ster = true;
                            _3ster = false;
                            _4ster = false;
                            _5ster = false;
                            foo = false;
                          }
                        });
                      }),
                  new IconButton(
                      icon: new Icon(Icons.stars),
                      iconSize: 35.0,
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.bottomRight,
                      color: _3ster ? Colors.blue : Colors.black,
                      onPressed: () {
                        print("3 ster");
                        setState(() {
                          _sterRating = 3;
                          if (_sterRating == 3) {
                            _1ster = true;
                            _2ster = true;
                            _3ster = true;
                            _4ster = false;
                            _5ster = false;
                            foo = false;
                          }
                        });
                      }),
                  new IconButton(
                      icon: new Icon(Icons.stars),
                      iconSize: 35.0,
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.bottomRight,
                      color: _4ster ? Colors.blue : Colors.black,
                      onPressed: () {
                        print("4 ster");
                        setState(() {
                          _sterRating = 4;
                          if (_sterRating == 4) {
                            _1ster = true;
                            _2ster = true;
                            _3ster = true;
                            _4ster = true;
                            _5ster = false;
                            foo = false;
                          }
                        });
                      }),
                  new IconButton(
                      icon: new Icon(Icons.stars),
                      iconSize: 35.0,
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.bottomRight,
                      color: _5ster ? Colors.blue : Colors.black,
                      onPressed: () {
                        print("5 ster");
                        setState(() {
                          _sterRating = 5;
                          if (_sterRating == 5 && _5ster == false) {
                            _1ster = true;
                            _2ster = true;
                            _3ster = true;
                            _4ster = true;
                            _5ster = true;
                            foo = false;
                          }
                        });
                      })
                ],
              )),
          new ButtonTheme(
            height: 50.0,
            minWidth: 150.0,
            child: RaisedButton(
              onPressed: () {
                if (_sterRating <= 0) {
                  alert(context, "Geen rating", "Vul aantal sterren in");
                } else {
                  postData(_sterRating, naam, opmerkingen, widget.id);
                  alert(context, "Uw review is ontvangen",
                      "Bedankt voor uw feedback");
                }
              },
              color: Colors.blue,
              highlightColor: Colors.lightBlue,
              child: Text(
                'Confirm',
                style: new TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ))),
    );
  }
}

String rating;
String comment;
String name;
String parkingspot;
//method for posting data
Future<int> postData(int sterren, String user, String remark, int id) async {

    rating = sterren.toString();
    if(name == ""){
      name ="Anoniem";
    }else{
      name = user;
    }
    comment = remark;
    parkingspot = id.toString();

    String link = "https://projectse7.azurewebsites.net/post.php?rate=" +
        rating +
        "&comment=" +
        comment +
        "&name=" +
        name +
        "&spot=" +
        parkingspot;
    await http.post(link);
    print("posted data");
    print(link);
    return 1;
  }


void alert(BuildContext context, String title, String comment) {
  var alertDialog = AlertDialog(
    title: Text(title),
    content: Text(comment),
  );

  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}
