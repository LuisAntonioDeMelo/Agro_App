import 'dart:io';

import 'package:agro_app/components/camera-permissao.component.dart';
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width / 0.5,
                height: MediaQuery.of(context).size.height/5,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const ListTile(
                        title: Center(
                          child: Text(
                            "Propriedades",
                            style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w700,fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Imagem"), Text("500x500")],
                      ),
                       SizedBox(
                        height: 4,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Arquivo"), Text("file_agro.jpg")],
                      ),
                       SizedBox(
                        height: 4,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Download"), Text("2.1 mb")],
                      ),
                       SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
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
        });
      }
    } catch (e) {
      print(e);
    }
  }
}


