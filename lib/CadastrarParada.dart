import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:io';
import 'Mapa.dart';
import 'model/Parada.dart';
import 'dart:async';
//import 'dart:convert';



class CadastrarParada extends StatefulWidget {
  @override
  _CadastrarParadaState createState() => _CadastrarParadaState();
}

class _CadastrarParadaState extends State<CadastrarParada> {
  
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerDescricao = TextEditingController();
  

  _cadastrarParada( Parada parada ){
    /*FirebaseAuth auth = FirebaseAuth.instance;

    Firestore db = Firestore.instance;
    db.collection("paradas")
    .document("parada")
    .setData(parada.toMap());

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
        builder: (context) => Home()
    )
    );*/
  }


  _validarCampos(){
    String id = "1";
    String nome = _controllerNome.text;
    String descricao = _controllerDescricao.text;
    String foto = "";
    String localizacao = "";
    
    if ( nome.isNotEmpty && descricao.isNotEmpty && descricao.length > 10){
        Parada parada = Parada();
        parada.id = id;
        parada.nome = nome;
        parada.descricao = descricao;
        parada.foto = foto;
        parada.localizacao = localizacao;

        _cadastrarParada( parada );
            }else{
      
    }
  }

  _adicionarLocal(){

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => Mapa()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0F2287),
        title: Image.asset("img/logo3.png", width: 98, height: 22,),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: <Widget>[
            Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Image.asset("img/addparada.png", width: 300, height: 150,),
            ),
            
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome da Parada"
              ),
              style: TextStyle(fontSize: 20),
              //controller: _controllerAlcool,
            ),

            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Descrição da Parada"
              ),
              style: TextStyle(fontSize: 20),
              //controller: _controllerGasolina,
            ),
            
            Padding(
              padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
              child: RaisedButton(
                color: Color(0xff0F2287),
                textColor: Colors.white,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    Icon(Icons.photo_camera, color: Colors.white),
                    Text("  Adicionar Foto", style: TextStyle(fontSize: 20),
                  ),
                ],
                ),
                onPressed: (){
                  // _calcular
                } 
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 5, 16, 16),
              child: RaisedButton(
                color: Color(0xff0F2287),
                textColor: Colors.white,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    Icon(Icons.add_location, color: Colors.white),
                    Text("  Adicionar Localização", style: TextStyle(fontSize: 20),
                  ),
                ],
                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Mapa()
                      )
                  );
                } 
              ),
            ),
          ],
        ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff000080),
        foregroundColor: Colors.white,
        child: Icon(Icons.check),
        onPressed: (){
          _validarCampos();
        }
        ),
    );
  }
}