import 'package:flutter/material.dart';
import 'main.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'profil-member.dart';
import 'dart:convert';
import 'dart:async';
import 'detail-admin.dart';
import 'detail-member.dart';
import 'package:http/http.dart' as http;

class HomeMember extends StatelessWidget{

  Future<List> getData() async {
    final response=await http.get("http://192.168.100.59/avera/homeadmin.php");
    return json.decode(response.body);
  }
  Future<List> getData2() async {
    final response=await http.get("http://192.168.100.59/avera/homemember.php");
    return json.decode(response.body);
  }

  HomeMember({this.username, this.id, this.membership, this.nama, this.gender, this.email, this.no_telp, this.alamat, this.tgl_join, this.password});
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
	Widget build(BuildContext context){
		return new Scaffold(
			appBar: new AppBar(title: new Text('Avera Membership'),
			),
      body: new Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 10),
            child: new Text("Admin"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Container(
              height: 220,
              child: new FutureBuilder<List>(
                future: getData(),
                builder: (context, snapshot){
                  if(snapshot.hasError) print (snapshot.error);

                  return snapshot.hasData 
                  ? new ItemList(list: snapshot.data,) 
                  : new Center(child:  new CircularProgressIndicator(),);
                },
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(top: 260.0, left: 10),
            child: new Text("Member"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 280.0),
            child: new FutureBuilder<List>(
              future: getData2(),
              builder: (context, snapshot){
                if(snapshot.hasError) print (snapshot.error);

                return snapshot.hasData 
                ? new ItemList2(list: snapshot.data,) 
                : new Center(child:  new CircularProgressIndicator(),);
              },
            )
          )
        ]
      ),
			drawer: new Drawer(
				child: ListView(
					children: <Widget>[
						new UserAccountsDrawerHeader(
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/068b1c67-1acc-4015-815d-89228ffc3a09/d91rq6h-4444a2e1-1a4f-4240-b344-06e12b6ef6bc.jpg/v1/fill/w_800,h_1132,q_75,strp/blossom_in_autumn_by_zhowee14_d91rq6h-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD0xMTMyIiwicGF0aCI6IlwvZlwvMDY4YjFjNjctMWFjYy00MDE1LTgxNWQtODkyMjhmZmMzYTA5XC9kOTFycTZoLTQ0NDRhMmUxLTFhNGYtNDI0MC1iMzQ0LTA2ZTEyYjZlZjZiYy5qcGciLCJ3aWR0aCI6Ijw9ODAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.7wEr2Kd7hP9u6NlfJDer47ABCf1rOD3xFLATv-cwH5c"), 
                ),
              ),
							accountName: new Text(nama, style: TextStyle(fontSize:16,),),
							accountEmail: new Text(membership, style: TextStyle(fontSize:12),),
							currentAccountPicture: Center(
							  child: new CircleAvatar(
							  	backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
                  radius: 150,
							  ),
							),
						),
            new ListTile(
              title: new Text("Profil"),
              leading: Icon(EvaIcons.person, color: Colors.orange),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => ProfilMember(username:username, id:id, membership:membership, nama:nama, gender:gender, email:email, no_telp:no_telp, alamat:alamat, tgl_join:tgl_join, password:password,)));
              },
            ),
            Divider(),
            new ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title:  new Text("Logout"),
              onTap: (){
                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Loading()));
              }
            ),
					],
				),
			),
		);
	}
}

class ItemList extends StatelessWidget {

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Container(
          child: new GestureDetector(
            onTap:(){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => DetailAdmin(list: list, index: i,)));
            },
            child: new Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
                      radius: 30,
							      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children:<Widget>[
                              new Text(list[i]['nama'], style: TextStyle(fontSize: 15,),),
                            ]
                          ),
                          Row(
                            children:<Widget>[
                              new Icon(EvaIcons.awardOutline, color: Colors.grey[700], size:15),
                              Text("${list[i]['membership']}", style: TextStyle(fontSize: 13, color: Colors.grey[700])),  
                            ]                          
                          ),
                          Row(
                            children:<Widget>[
                              new Icon(EvaIcons.hashOutline, color: Colors.grey[700], size: 15),
                              new Text("${list[i]['id']}", style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                            ]
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
class ItemList2 extends StatelessWidget {

  final List list;
  ItemList2({this.list});

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Container(
          child: new GestureDetector(
            onTap:(){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => DetailMember(list: list, index: i,)));
            },
            child: new Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
                      radius: 30,
							      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children:<Widget>[
                              new Text(list[i]['nama'], style: TextStyle(fontSize: 15,),),
                            ]
                          ),
                          Row(
                            children:<Widget>[
                              new Icon(EvaIcons.awardOutline, color: Colors.grey[700], size:15),
                              Text("${list[i]['membership']}", style: TextStyle(fontSize: 13, color: Colors.grey[700])),  
                            ]                          
                          ),
                          Row(
                            children:<Widget>[
                              new Icon(EvaIcons.hashOutline, color: Colors.grey[700], size: 15),
                              new Text("${list[i]['id']}", style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                            ]
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}