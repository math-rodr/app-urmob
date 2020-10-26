import 'package:flutter/material.dart';
import 'package:urmparadas/CadastrarParada.dart';
import 'package:urmparadas/EditarParada.dart';
import 'package:urmparadas/VerParada.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _controller = StreamController<QuerySnapshot>.broadcast();
  Firestore _db = Firestore.instance;

  var dados;

  _adicionarListenerParadas() async {
    final stream = _db.collection("paradas")
        .snapshots();

    stream.listen((dados) {
      _controller.add(dados);
    });

  }


  recuperarFirebase() async {
    DocumentSnapshot documentSnapshot = await _db
        .collection("paradas")
        .document()
        .get();
      var dados = documentSnapshot.data;

      String nome = dados["nome"];
      String descricao = dados["descricao"];


  }

  @override
  void initState() {
    super.initState();

    _adicionarListenerParadas();
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



      /////////////////////////////////

      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 5, //dados.length,
              itemBuilder: (context, index){
               // final anotacao = _anotacoes[index];
                return Card(
                  child: ListTile(
                    title: Text( "dados.nome" ),//Text( anotacao.titulo ),
                    subtitle: Text("DESCRIÇÃO DA PARADA DESCRIÇÃO DA PARADA DESCRIÇÃO DA PARADA"),//Text("${_formatarData(anotacao.data)} - ${anotacao.descricao}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            //_exibirTelaCadastro( anotacao: anotacao);
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> VerParada() )
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons. looks,
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
                           // _removerAnotacao(anotacao.id);
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
            )
          )
        ],
      ),

 /*
 * Container(
                          height: 90,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                          decoration: BoxDecoration(
                           /* gradient: LinearGradient(
                              stops: [0.015, 0.015],
                              colors: [Colors.purple, Colors.purple],
                            ),*/
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Card(
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(snapshot.data[index].data["nome"]),
                                  ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(snapshot.data[index].data["descricao"]),
                                ],
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset("img/pin.png"),
                                //child: Image.network("https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male2-128.png"),
                              ),
                            ),
                          ),
                        );
 * */
    );
  }
}





