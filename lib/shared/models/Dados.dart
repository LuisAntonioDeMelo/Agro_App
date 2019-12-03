class Dados {
  String titulo;
  String descricao;
  String imagemUrl;
  String data;

  Dados();

  Dados.fill(titulo, descricao, imagemUrl) {
    this.titulo = titulo;
    this.descricao = descricao;
    this.imagemUrl = imagemUrl;
  }

  List<Dados> getDados() {
    Dados d1 = new Dados();
    d1.descricao = 'This is a plage of notthing';
    d1.data = '20/07/2019';
    d1.imagemUrl = 'imagens/news1.jpg';
    d1.titulo = 'Soja Periodos';
    List<Dados> dados = new List();
    dados.add(d1);
    return dados;
  }
}
