import 'package:avera/login-member.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class EditProfilMember extends StatefulWidget {
  final String username;
  final String id;
  final String membership;
  final String nama;
  final String gender;
  final String email;
  final String no_telp;
  final String alamat;
  final String tgl_join;
  final String password;
  EditProfilMember({Key key, this.username, this.id, this.membership, this.nama, this.gender, this.email, this.no_telp, this.alamat, this.tgl_join, this.password}) : super(key: key);
  @override
  _EditProfilMemberState createState() => _EditProfilMemberState();
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

class _EditProfilMemberState extends State<EditProfilMember> {
  
  TextEditingController controlleredituser = new TextEditingController(text:username);
  TextEditingController controllereditid = new TextEditingController(text:id);
  TextEditingController controllereditmember = new TextEditingController(text:membership);
  TextEditingController controllereditnama = new TextEditingController(text:nama);
  TextEditingController controllereditgender = new TextEditingController(text:gender);
  TextEditingController controllereditemail = new TextEditingController(text:email);
  TextEditingController controlleredittelp = new TextEditingController(text:no_telp);
  TextEditingController controllereditalamat = new TextEditingController(text:alamat);
  TextEditingController controllereditjoin = new TextEditingController(text:tgl_join);
  TextEditingController controllereditpass = new TextEditingController(text:password);

  void editData(){
    var url = "http://192.168.100.59/avera/editprofilmember.php";
    http.post(url, body:{
      "username" : controlleredituser.text,
      "id" : controllereditid.text,
      "membership" : controllereditmember.text,
      "nama" : controllereditnama.text,
      "gender" : controllereditgender.text,
      "email" : controllereditemail.text,
      "no_telp" : controlleredittelp.text,
      "alamat" : controllereditalamat.text,
      "tgl_join" : controllereditjoin.text,
      "password" : controllereditpass.text,
    });
  }
  @override
  void iniState(){
    controlleredituser;
    controllereditid;
    controllereditmember;
    controllereditnama;
    controllereditgender;
    controllereditemail;
    controlleredittelp;
    controllereditalamat;
    controllereditjoin;
    controllereditpass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('Edit Profil Member'),
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
              _usernameEDIT(),
              SizedBox(height: 20.0),
              _idEDIT(),
              SizedBox(height: 20.0),
              _membershipEDIT(),
              SizedBox(height: 20.0),
              _namaEDIT(),
              SizedBox(height: 20.0),
              _genderEDIT(),
              SizedBox(height: 20.0),
              _emailEDIT(),
              SizedBox(height: 20.0),
              _telpEDIT(),
              SizedBox(height: 20.0),
              _alamatEDIT(),
              SizedBox(height: 20.0),
              _joinEDIT(),
              SizedBox(height: 20.0),
              Divider(),
              SizedBox(height: 20.0),
              _passwordEDIT(),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _simpan(),
                  _cancel(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameEDIT(){
    return Form(
      key: _formUsername,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            readOnly: true,
            controller: controlleredituser,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Username Baru',
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

  Widget _idEDIT(){
    return Form(
      key: _formId,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            readOnly: true,
            controller: controllereditid,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan ID Member Baru',
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

  Widget _membershipEDIT(){
    return Form(
      key: _formMembership,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            readOnly: true,
            controller: controllereditmember,
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

  Widget _namaEDIT(){
    return Form(
      key: _formNama,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            readOnly: true,
            controller: controllereditnama,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Nama Lengkap Baru',
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

  Widget _genderEDIT(){
    return Form(
      key: _formGender,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            readOnly: true,
            controller: controllereditgender,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Jenis Kelamin Baru',
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

  Widget _emailEDIT(){
    return Form(
      key: _formEmail,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controllereditemail,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Alamat Email Baru',
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

  Widget _telpEDIT(){
    return Form(
      key: _formTelp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controlleredittelp,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Nomor Telepon Baru',
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

  Widget _alamatEDIT(){
    return Form(
      key: _formAlamat,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controllereditalamat,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Masukkan Alamat Baru',
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

  Widget _joinEDIT(){
    return Form(
      key: _formJoin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            readOnly: true,
            controller: controllereditjoin,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Tanggal Join (YYYY-MM-DD)',
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

  Widget _passwordEDIT(){
    return Form(
      key: _formPassword,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controllereditpass,
            autofocus: false,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Masukkan Password Baru(6-16 Karakter)',
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

  Widget _simpan(){
    return Form(
      child: Column(
        children:<Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              borderRadius: BorderRadius.circular(0.0),
              child: MaterialButton(
                minWidth: 130.0,
                height: 55.0,
                onPressed: () {
                  if(_formUsername.currentState.validate()&_formId.currentState.validate()&_formMembership.currentState.validate()&_formNama.currentState.validate()&_formGender.currentState.validate()&_formEmail.currentState.validate()&_formTelp.currentState.validate()&_formAlamat.currentState.validate()&_formJoin.currentState.validate()&_formPassword.currentState.validate()){
                    editData();
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
                                  Text(
                                    'Perubahan berhasil disimpan! Silakan login kembali untuk memperbaharui data.'
                                  ),
                                  SizedBox(
                                    width: 320.0,
                                    child: RaisedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Loading()));
                                      },
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
                color: Colors.green,
                child: Text('Simpan', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ]
      ),
    );
  }
  Widget _cancel(){
    return Form(
      child: Column(
        children:<Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              borderRadius: BorderRadius.circular(0.0),
              child: MaterialButton(
                minWidth: 130.0,
                height: 55.0,
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.red,
                child: Text('Batal', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ]
      ),
    );
  }
}