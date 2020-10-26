class Parada {

  String _id;
  String _nome;
  String _descricao;
  String _foto;
  String _localizacao;

  Parada();

     Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "id" : this.id,
      "nome" : this.nome,
      "descricao" : this.descricao,
      "foto" : this.foto,
      "localizacao" : this.localizacao,
    };
  return map;
  } 

  String get localizacao => _localizacao;
  set localizacao(String value){
    _localizacao = value;
  }

  String get foto => _foto;
  set foto(String value){
    _foto = value;
  }

  String get descricao => _descricao;
  set descricao(String value){
    _descricao = value;
  }

  String get nome => _nome;
  set nome(String value){
    _nome = value;
  }

  String get id => _id;
  set id(String value){
    _id = value;
  }




}