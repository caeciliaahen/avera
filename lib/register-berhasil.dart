import 'package:flutter/material.dart';
import 'daftar-member.dart';

class RegisterBerhasil extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Daftarkan Member"),),
      body: Stack(
        children: <Widget>[
                                  Image.asset('assets/registerDialog.gif'),
                                  TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Member Berhasil Didaftarkan!'),
                                  ),
                                  SizedBox(
                                    width: 320.0,
                                    child: RaisedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => DaftarMember()));
                                      },
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: const Color(0xFF1BC0C5),
                                    ),
                                  )
        ]
      )
    );
  }
}