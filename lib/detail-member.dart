import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class DetailMember extends StatefulWidget {
  List list;
  int index;
  DetailMember({this.index,this.list});
  @override
  _DetailMemberState createState() => _DetailMemberState();
}

class _DetailMemberState extends State<DetailMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Detail Profil Member'),
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
                accountName: new Text(widget.list[widget.index]['nama']),
                accountEmail: new Text(widget.list[widget.index]['membership']),
                currentAccountPicture: Center(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
                    radius: 150,
                  ),
							  ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.hashOutline, color: Colors.grey),
                  title: Text("ID Member", style: new TextStyle(color: Colors.grey[600], fontSize: 12)),
                  subtitle: Text(widget.list[widget.index]['id']),
                )
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.emailOutline, color: Colors.grey),
                  title: Text("Email", style: new TextStyle(color: Colors.grey[600], fontSize: 12)),
                  subtitle: Text(widget.list[widget.index]['email']),
                )
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.phoneOutline, color: Colors.grey),
                  title: Text("No Telepon", style: new TextStyle(color: Colors.grey[600], fontSize: 12)),
                  subtitle: Text(widget.list[widget.index]['no_telp']),
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.homeOutline, color: Colors.grey),
                  title: Text("Alamat", style: new TextStyle(color: Colors.grey[600], fontSize: 12)),
                  subtitle: Text(widget.list[widget.index]['alamat']),
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.questionMarkCircleOutline, color: Colors.grey),
                  title: Text("Jenis Kelamin", style: new TextStyle(color: Colors.grey[600], fontSize: 12)),
                  subtitle: Text(widget.list[widget.index]['gender']),
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(EvaIcons.calendarOutline, color: Colors.grey),
                  title: Text("Tanggal Bergabung", style: new TextStyle(color: Colors.grey[600], fontSize: 12,)),
                  subtitle: Text(widget.list[widget.index]['tgl_join']),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}