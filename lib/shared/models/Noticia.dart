class Noticia {
  String titulo;
  String descricao;
  String imagemUrl;
  String data;
  String texto;

  Noticia();

  Noticia.fill(titulo, descricao, imagemUrl,texto) {
    this.titulo = titulo;
    this.descricao = descricao;
    this.imagemUrl = imagemUrl;
    this.texto = texto;
  }
}