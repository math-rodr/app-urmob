import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:urmparadas/CadastrarParada.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'EditarParada.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  String _emailUsuario = "";

  Future _recuperarDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();

    setState(() {
      _emailUsuario = usuarioLogado.email;
    });
  }



  Future getParadas() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("paradas").getDocuments();

    return qn.documents;
  }

  _removerParada(String idParada) async {
        //qn.collection("paradas").document( idParada).delete();
  }

  @override
  void initState() {

    _recuperarDadosUsuario();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0F2287),
        title: Image.asset("img/logo3.png", width: 98, height: 22,),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff0F2287),
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> CadastrarParada() )
            );
          }
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder(
              future: getParadas(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting){
                  return new Center (
                    child: CircularProgressIndicator(),
                  );
                }else{
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        return Card(

                          child: ListTile(
                            title: Text( snapshot.data[index].data["nome"] ),//Text( anotacao.titulo ),
                            subtitle: Text(snapshot.data[index].data["descricao"]),//Text("${_formatarData(anotacao.data)} - ${anotacao.descricao}"),
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("img/pin.png"),
                              //child: Image.network("https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male2-128.png"),
                            ),
                            trailing: Row(

                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                   Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=> EditarParada() )
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Icon(
                                      Icons.visibility,
                                      color: Color(0xff0F2287),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    //_exibirTelaCadastro( anotacao: anotacao);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=> EditarParada() )
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Icon(
                                      Icons.edit,
                                      color: Color(0xff0F2287),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                     _removerParada( snapshot.data[index].data["id"] );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 0),
                                    child: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        );

                      }
                  );
                }
              },
            )
          )
        ],
      )
    );
  }
}