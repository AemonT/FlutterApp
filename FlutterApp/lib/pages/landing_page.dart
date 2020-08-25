import 'package:flutter/material.dart';
import './EigenLocatie.dart';
import './VindLocatie.dart';

///Homescreen van de app
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar/tittle van pagina
        appBar: new AppBar(
          title: new Text("P-App"),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: new Center(
            child: new Column(
          //de alignment in het midden gezet
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 200.0,
              height: 10.0,
              //knop om te navigeren naar locatie van de gebruiker
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VindLocatie()),
                  );
                },
                elevation: 5.0,
                textColor: Colors.blue,
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Zoek met uw locatie",
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 200.0,
              height: 10.0,
              //knop om te navigeren naar pagina waar gebruiker zelf locatie invoert
              child: RaisedButton(
                onPressed: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EigenLocatie()),
                  );
                  showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(Duration(seconds: 5), () {
                          Navigator.of(context).pop(true);
                        });
                        return AlertDialog(
                          title: Text(
                              'Deze pagina is nog onder development en kan raar gedrag vertonen'),
                        );
                      });
                },
                elevation: 5.0,
                textColor: Colors.blue,
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Zoek met opgegeven locatie",
                ),
              ),
            ),
          ],
        )));
  }
}
