import 'dart:io';

import 'package:agro_app/components/camera-permissao.component.dart';
import 'package:agro_app/screens/screens.predicoes/detalhes-predicao.dart';
import 'package:agro_app/shared/models/Dados.dart';
import 'package:agro_app/shared/models/Dados.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GaleriaImagens extends StatefulWidget {
  @override
  _GaleriaImagensState createState() => _GaleriaImagensState();
}

File imagem;

class _GaleriaImagensState extends State<GaleriaImagens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightGreen[300], Colors.green[50]],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white,
                  child: MaterialButton(
                    child: imagem != null
                        ? Image.file(imagem, fit: BoxFit.fill)
                        : Image.asset('imagens/logo_agro_green.png'),
                    onPressed: () {
                      obterGaleria(imagem);
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: MaterialButton(
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: ListTile(
                      leading: Icon(Icons.cloud_upload),
                      title: Text(
                        'Carregar uma Imagem',
                        style: TextStyle(
                            fontFamily: 'Roboto sans serif',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  onPressed: (){
                    setState(() {
                      obterGaleria(imagem);
                    });
                  },
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Future obterGaleria(File imagem) async {
    try {
      if (await isContemPermissoes()) {
        var imagemGaleria =
            await ImagePicker.pickImage(source: ImageSource.gallery);
        this.setState(() {
          imagem = imagemGaleria;
           Navigator.push(
            context, MaterialPageRoute(builder: (context) => Detalhe(
              new Dados.fill(
                "titulo", 
                "descricao", 
                "tipo",
                 "imagemUrl", 
                 "acuracia",
                  "texto"))));
        });
      }
    } catch (e) {
      print(e);
    }
  }
}


