import 'package:flutter/material.dart';

class EditarParada extends StatefulWidget {
  @override
  _EditarParadaState createState() => _EditarParadaState();
}

class _EditarParadaState extends State<EditarParada> {
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: <Widget>[
            Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Image.asset("img/editparadas.png", width: 300, height: 150,),
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
            
            /*Padding(
              padding: EdgeInsets.all(10),
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
            ),*/
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
                    
                    Icon(Icons.edit_location, color: Colors.white),
                    Text("  Alterar Localização", style: TextStyle(fontSize: 20),
                  ),
                ],
                ),
                onPressed: (){
                  // _calcular
                } 
              ),
            ),
          ],
        ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0F2287),
        foregroundColor: Colors.white,
        child: Icon(Icons.check),
        onPressed: (){

        }
        ),

    );
  }
}