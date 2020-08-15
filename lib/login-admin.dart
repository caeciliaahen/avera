import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home-admin.dart';
import 'main.dart';

String username = "";
String id = "";
String membership = "";
String nama = "";
String gender = "";
String email = "";
String no_telp = "";
String alamat = "";
String tgl_join = "";
String password = "";
class LoginAdmin extends StatefulWidget{
  LoginAdmin({Key key}) : super(key: key);
  @override
  _LoginAdminState createState() => new _LoginAdminState();
}

final _formUsername= GlobalKey<FormState>();
final _formPassword = GlobalKey<FormState>();

class _LoginAdminState extends State<LoginAdmin>{
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String alert='';

  Future<void> _loginS() async{
    final response = await http.post("http://192.168.100.59/avera/loginadmin.php", body:{
      "username": user.text,
      "password": pass.text,
    });
    var admin = json.decode(response.body);
    if(admin.length==0){
      setState(() {
        alert="Username/Password Salah";
      });
    }
    else{
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => HomeAdmin(username:username, id:id, membership:membership, nama:nama, gender:gender, email:email, no_telp:no_telp, alamat:alamat, tgl_join:tgl_join, password:password,)));
      setState(() {
        username = admin[0]['username'];
        id = admin[0]['id'];
        membership = admin[0]['membership'];
        nama = admin[0]['nama'];
        gender = admin[0]['gender'];
        email = admin[0]['email'];
        no_telp = admin[0]['no_telp'];
        alamat = admin[0]['alamat'];
        tgl_join = admin[0]['tgl_join'];
        password = admin[0]['password'];
      });
    }
  }
  @override

  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white,
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
                child: Image(image: AssetImage('assets/avera.png',), width: 150.0, height: 180.0),
              ),
              FlatButton(
                splashColor: Colors.transparent,  
                highlightColor: Colors.transparent,
                child: Text(
                  'Masuk Sebagai Admin',
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
                onPressed: () {
                },
              ),
              _username(),
              SizedBox(height: 20.0),
              _password(),
              SizedBox(height: 15.0),
              Row(
                children: <Widget>[
                  //Icon(EvaIcons.person, color: Colors.red),
                  Text("  "), 
                  Text(alert, style: TextStyle(color:Colors.red[900]),),
                ],
              ),
              _login(),
              FlatButton(
                splashColor: Colors.transparent,  
                highlightColor: Colors.transparent,
                child: Text(
                  'Kembali',
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, 
                    new MaterialPageRoute(builder: (context) => Loading()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _username(){
    return Form(
      key: _formUsername,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: user,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Username',
              prefixIcon: Icon(EvaIcons.personOutline, color: Colors.grey),
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0), ), 
            ),
            validator: (value){
              if(value.isEmpty){
                return "Username tidak boleh kosong!";
              }
              return null;
            },
          ),
        ]
      )
    );
  }

  Widget _password(){
    return Form(
      key: _formPassword,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: pass,
            autofocus: false,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Masukkan Password',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(EvaIcons.lockOutline, color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
            ),
            validator: (value){
              if(value.isEmpty){
                return "Password tidak boleh kosong!";
              }
              return null;
            },
          ),
        ]
      )
    );
  }

  Widget _login(){
    return Form(
      child: Column(
        children:<Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              borderRadius: BorderRadius.circular(0.0),
              shadowColor: Colors.lightBlueAccent.shade100,
              child: MaterialButton(
                minWidth: 330.0,
                height: 55.0,
                onPressed: () {
                  if(_formUsername.currentState.validate()&_formPassword.currentState.validate()){
                    _loginS();
                  }
                },
                color: Colors.lightBlueAccent,
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ]
      ),
    );
  }
}