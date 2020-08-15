import 'package:flutter/material.dart';
import 'login-member.dart';
import 'login-admin.dart';

void main()=>runApp(new MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Loading(),
      routes: <String,WidgetBuilder>{
        'LoginAdmin' : (BuildContext context) => new LoginAdmin(),
        'LoginMember' : (BuildContext context) => new LoginMember(),
      }
    );
  }
}

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: Container(
          /*decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/background.png'), fit:BoxFit.cover)
          ),*/
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image(image: AssetImage('assets/avera.png',), width: 200.0, height: 200.0),
                ),
                RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18)
                  ),
                  child: Text(
                    "Masuk Sebagai Member",
                    style: TextStyle(
                      color: Colors.white
                    )
                  ),
                  onPressed:(){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => LoginMember())
                    );
                  }
                ),
                FlatButton(
                  splashColor: Colors.transparent,  
                  highlightColor: Colors.transparent,
                  child: Text(
                    'Masuk Sebagai Admin',
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, 
                      new MaterialPageRoute(builder: (context) => LoginAdmin()));
                  },
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}