import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'register-berhasil.dart';

class DaftarMember extends StatefulWidget{
  DaftarMember({Key key}) : super(key: key);
  @override
  _DaftarMemberState createState() => new _DaftarMemberState();
}

final _formUsername= GlobalKey<FormState>();
final _formId= GlobalKey<FormState>();
final _formMembership= GlobalKey<FormState>();
final _formNama= GlobalKey<FormState>();
final _formGender = GlobalKey<FormState>();
final _formEmail = GlobalKey<FormState>();
final _formTelp = GlobalKey<FormState>();
final _formAlamat= GlobalKey<FormState>();
final _formJoin = GlobalKey<FormState>();
final _formPassword = GlobalKey<FormState>();

class _DaftarMemberState extends State<DaftarMember>{
  TextEditingController controlleruser = new TextEditingController();
  TextEditingController controllerid = new TextEditingController();
  TextEditingController controllermember = new TextEditingController();
  TextEditingController controllernama = new TextEditingController();
  TextEditingController controllergender = new TextEditingController();
  TextEditingController controlleremail = new TextEditingController();
  TextEditingController controllertelp = new TextEditingController();
  TextEditingController controlleralamat = new TextEditingController();
  TextEditingController controllerjoin = new TextEditingController();
  TextEditingController controllerpass = new TextEditingController();

  void _registerS(){
    var url = "http://192.168.100.59/avera/registermember.php";
    http.post(url, body:{
      "username" : controlleruser.text,
      "id" : controllerid.text,
      "membership" : controllermember.text,
      "nama" : controllernama.text,
      "gender" : controllergender.text,
      "email" : controlleremail.text,
      "no_telp" : controllertelp.text,
      "alamat" : controlleralamat.text,
      "tgl_join" : controllerjoin.text,
      "password" : controllerpass.text,
    });
  }

  @override

  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('Daftarkan Member'),
      ),
      body: Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(13.0),
              ),
              _usernameREG(),
              SizedBox(height: 20.0),
              _idREG(),
              SizedBox(height: 20.0),
              _membershipREG(),
              SizedBox(height: 20.0),
              _namaREG(),
              SizedBox(height: 20.0),
              _genderREG(),
              SizedBox(height: 20.0),
              _emailREG(),
              SizedBox(height: 20.0),
              _telpREG(),
              SizedBox(height: 20.0),
              _alamatREG(),
              SizedBox(height: 20.0),
              _joinREG(),
              SizedBox(height: 20.0),
              _passwordREG(),
              SizedBox(height: 20.0),
              _register(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameREG(){
    return Form(
      key: _formUsername,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controlleruser,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Username',
              prefixIcon: Icon(EvaIcons.atOutline, color: Colors.grey),
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0), ), 
            ),
            validator: (value){
              if(value.isEmpty){
                return "Username tidak boleh kosong!";
              }
              return null;
            }
          ),
        ]
      )
    );
  }

  Widget _idREG(){
    return Form(
      key: _formId,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controllerid,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan ID Member',
              prefixIcon: Icon(EvaIcons.hashOutline, color: Colors.grey),
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0), ), 
            ),
            validator: (value){
              if(value.isEmpty){
                return "ID member tidak boleh kosong!";
              }
              return null;
            }
          ),
        ]
      )
    );
  }

  Widget _membershipREG(){
    return Form(
      key: _formMembership,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controllermember,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Status Keanggotaan',
              prefixIcon: Icon(EvaIcons.awardOutline, color: Colors.grey),
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0), ), 
            ),
            validator: (value){
              if(value.isEmpty){
                return "Status keanggotaan tidak boleh kosong!";
              }
              return null;
            }
          ),
        ]
      )
    );
  }

  Widget _namaREG(){
    return Form(
      key: _formNama,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controllernama,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Nama Lengkap',
              prefixIcon: Icon(EvaIcons.personOutline, color: Colors.grey),
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0), ), 
            ),
            validator: (value){
              if(value.isEmpty){
                return "Nama tidak boleh kosong!";
              }
              return null;
            }
          ),
        ]
      )
    );
  }

  Widget _genderREG(){
    return Form(
      key: _formGender,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controllergender,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Jenis Kelamin',
              prefixIcon: Icon(EvaIcons.questionMarkCircleOutline, color: Colors.grey),
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0), ), 
            ),
            validator: (value){
              if(value.isEmpty){
                return "Jenis kelamin tidak boleh kosong!";
              }
              return null;
            }
          ),
        ]
      )
    );
  }

  Widget _emailREG(){
    return Form(
      key: _formEmail,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controlleremail,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Alamat Email',
              prefixIcon: Icon(EvaIcons.emailOutline, color: Colors.grey),
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0), ), 
            ),
            validator: (value){
              if(value.isEmpty){
                return "Email tidak boleh kosong!";
              }
              return null;
            }
          ),
        ]
      )
    );
  }

  Widget _telpREG(){
    return Form(
      key: _formTelp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controllertelp,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Nomor Telepon',
              prefixIcon: Icon(EvaIcons.phoneOutline, color: Colors.grey),
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0), ), 
            ),
            validator: (value){
              if(value.isEmpty){
                return "Nomor telepon tidak boleh kosong!";
              }
              return null;
            }
          ),
        ]
      )
    );
  }

  Widget _alamatREG(){
    return Form(
      key: _formAlamat,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controlleralamat,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Alamat',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(EvaIcons.homeOutline, color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
            ),
            validator: (value){
              if(value.isEmpty){
                return "Alamat tidak boleh kosong!";
              }
              return null;
            }
          ),
        ]
      )
    );
  }

  Widget _joinREG(){
    return Form(
      key: _formJoin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controllerjoin,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Tanggal Bergabung (YYYY-MM-DD)',
              prefixIcon: Icon(EvaIcons.calendarOutline, color: Colors.grey),
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0), ), 
            ),
            validator: (value){
              if(value.isEmpty){
                return "Tanggal bergabung tidak boleh kosong!";
              }
              return null;
            }
          ),
        ]
      )
    );
  }

  Widget _passwordREG(){
    return Form(
      key: _formPassword,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controllerpass,
            autofocus: false,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Masukkan Password (6-16 Karakter)',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(EvaIcons.lockOutline, color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
            ),
            validator: (value){
              if(value.isEmpty){
                return "Password tidak boleh kosong!";
              }
              else if(value.length<6){
                return "Password terlalu pendek!";
              }
              else if(value.length>16){
                return "Password terlalu panjang!";
              }
              return null;
            }
          ),
        ]
      )
    );
  }

  Widget _register(){
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
                  if(_formUsername.currentState.validate()&_formId.currentState.validate()&_formMembership.currentState.validate()&_formNama.currentState.validate()&_formGender.currentState.validate()&_formEmail.currentState.validate()&_formTelp.currentState.validate()&_formAlamat.currentState.validate()&_formJoin.currentState.validate()&_formPassword.currentState.validate()){
                    _registerS();
                    showDialog(
                      context:context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20.0)), //this right here
                          child: Container(
                            height: 312,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset('assets/registerDialog.gif'),
                                  TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Member Berhasil Didaftarkan!'),
                                  ),
                                  SizedBox(
                                    width: 320.0,
                                    child: RaisedButton(
                                      onPressed: () => Navigator.pop(context, false),                                   
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: const Color(0xFF1BC0C5),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    );
                  }
                },
                color: Colors.lightBlueAccent,
                child: Text('Register', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
