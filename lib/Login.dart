import 'package:flutter/material.dart';
import 'package:urmparadas/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:urmparadas/Inicio.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";
  String urmobEmail = ""; //"adm@urmob.com.br";
  String urmobSenha = ""; //"123456";

void _validarCampos(){

  urmobEmail = _controllerEmail.text;
  urmobSenha = _controllerSenha.text;

   if( urmobEmail.isNotEmpty && urmobEmail.contains("@") ){

        if( urmobSenha.isNotEmpty ){

          setState(() {
            _mensagemErro = "Usuário conectado com sucesso!";
          });

          _logarUsuario();


        }else{
          setState(() {
            _mensagemErro = "Preencha a senha corretamente!";
          });
        }

      }else{
        setState(() {
          _mensagemErro = "Preencha o E-mail corretamente";
        });
      }

}



_logarUsuario(){


  FirebaseAuth auth = FirebaseAuth.instance;
  auth.signInWithEmailAndPassword(
    email: urmobEmail,
    password: urmobSenha,
  ).then((firebaseUser){

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Inicio()
        )
    );

  }).catchError((error){
    setState(() {
      _mensagemErro = "Erro ao autenticar o usuário. Verifique seus dados e tente novamente";
    });
  });


}

  Future _verificarUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    //auth.signOut();

    FirebaseUser usuarioLogado = await auth.currentUser();

    if(usuarioLogado != null){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Inicio()
          )
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xffD3D3D3)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "img/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        )),
                  ),
                ),
                TextField(
                  controller: _controllerSenha,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Color(0xffFF8C00),
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    onPressed: () {

                      _validarCampos();
                    },
                  ),
                ),
               Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}