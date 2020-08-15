import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'edit-profil-member.dart';

class ProfilMember extends StatelessWidget {
  ProfilMember({this.username, this.id, this.membership, this.nama, this.gender, this.email, this.no_telp, this.alamat, this.tgl_join, this.password});
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Profil Member'),
      ),
      body: new SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: new Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/068b1c67-1acc-4015-815d-89228ffc3a09/d91rq6h-4444a2e1-1a4f-4240-b344-06e12b6ef6bc.jpg/v1/fill/w_800,h_1132,q_75,strp/blossom_in_autumn_by_zhowee14_d91rq6h-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD0xMTMyIiwicGF0aCI6IlwvZlwvMDY4YjFjNjctMWFjYy00MDE1LTgxNWQtODkyMjhmZmMzYTA5XC9kOTFycTZoLTQ0NDRhMmUxLTFhNGYtNDI0MC1iMzQ0LTA2ZTEyYjZlZjZiYy5qcGciLCJ3aWR0aCI6Ijw9ODAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.7wEr2Kd7hP9u6NlfJDer47ABCf1rOD3xFLATv-cwH5c"), 
                  ),
                ),
                accountName: new Text(nama),
                accountEmail: new Text("$membership"),
                currentAccountPicture: Center(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
                    radius: 150,
                  ),
							  ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.atOutline, color: Colors.grey),
                  title: Text("Username", style: new TextStyle(color: Colors.grey[600], fontSize: 12)),
                  subtitle: Text(username, style: new TextStyle(color: Colors.black, fontSize:14)),
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.hashOutline, color: Colors.grey),
                  title: Text("ID Member", style: new TextStyle(color: Colors.grey[600], fontSize: 12)),
                  subtitle: Text(id, style: new TextStyle(color: Colors.black, fontSize:14)),
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.emailOutline, color: Colors.grey),
                  title: Text("Email", style: new TextStyle(color: Colors.grey[600], fontSize: 12)),
                  subtitle: Text(email, style: new TextStyle(color: Colors.black, fontSize:14)),
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.phoneOutline, color: Colors.grey),
                  title: Text("No Telepon", style: new TextStyle(color: Colors.grey[600], fontSize: 12)),
                  subtitle: Text(no_telp, style: new TextStyle(color: Colors.black, fontSize:14)),
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.homeOutline, color: Colors.grey),
                  title: Text("Alamat", style: new TextStyle(color: Colors.grey[600], fontSize: 12)),
                  subtitle: Text(alamat, style: new TextStyle(color: Colors.black, fontSize:14)),
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.questionMarkCircleOutline, color: Colors.grey),
                  title: Text("Jenis Kelamin", style: new TextStyle(color: Colors.grey[600], fontSize: 12)),
                  subtitle: Text(gender, style: new TextStyle(color: Colors.black, fontSize:14)),
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.calendarOutline, color: Colors.grey),
                  title: Text("Tanggal Bergabung", style: new TextStyle(color: Colors.grey[600], fontSize: 12,)),
                  subtitle: Text(tgl_join, style: new TextStyle(color: Colors.black, fontSize:14)),
                ),
              ),
              Form(
                child: Column(
                  children:<Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(0.0),
                        shadowColor: Colors.lightGreenAccent.shade100,
                        child: MaterialButton(
                          minWidth: 150.0,
                          height: 35.0,
                          onPressed: () {
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => EditProfilMember(username:username, id:id, membership:membership, nama:nama, gender:gender, email:email, no_telp:no_telp, alamat:alamat, tgl_join:tgl_join, password:password,)));
                          },
                          color: Colors.green[700],
                          child: Text('Edit', style: TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}