
import 'dart:io';

import 'package:agro_app/components/camera-permissao.component.dart';
import 'package:agro_app/screens/screens.galeria/galeria.dart';
import 'package:agro_app/screens/screens.home/home.dart';
import 'package:agro_app/screens/screens.info/infor.dart';
import 'package:agro_app/screens/screens.predicoes/predicoes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/*
@author:Luis Antônio :
@param 
DashBoard será responsável pelo pageview da aplicação e troca entre menus
*/
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  File imagem;
  int menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Center(child: changeTitle(menuIndex)),
            backgroundColor: Colors.lightGreen),
        body: pageWiew(),
        bottomNavigationBar: menuNav(context),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
   
  //paginação
  PageController page = PageController(initialPage: 0, keepPage: true);

  Widget pageWiew() {
    return PageView(
      controller: page,
      onPageChanged: (index) {
        print(index);
        pageChange(index);
      },
      //TODO:Importar paginas aqui!!! [0,1,2,3...]
      children: <Widget>[
        new HomeConteudo(), 
        new GaleriaImagens(),
        new Red(),
        new PredicoesWidget(),
        new InfoComponent(),
        ],
    );
  }


  void tap(int index) {
    setState(() {
      menuIndex = index;
      page.animateToPage(index,duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }


  void pageChange(int index) {
    setState(() {
      menuIndex = index;
    });
  }
//navegação de items ps --refac extrair para o shared ....
  Widget menuNav(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromARGB(255, 107, 205, 18),
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            tap(index);
            if(index == 2){
                obterCamera(imagem);
              print("Open cam");
            }
          },
          currentIndex: menuIndex,
          fixedColor: Colors.white,
          items: menuItensNav(),
          backgroundColor: Colors.black45,
        ),
      );

  List<BottomNavigationBarItem> menuItensNav() => [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white),
          title: Text('Inicio'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.collections, color: Colors.white),
          title: Text('Galeria'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt, color: Colors.blueGrey[800], size: 30),
          title: Text('Câmera'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.format_list_bulleted, color: Colors.white),
          title: Text('Predições'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info, color: Colors.white),
          title: Text('Info'),
        ),
      ];
//fim dash
  Future obterCamera(File imagem) async {
    try {
      if (await isContemPermissoes()) {
        var imagemGaleria =
            await ImagePicker.pickImage(source: ImageSource.camera);
        this.setState(() {
          imagem = imagemGaleria;
        });
      }
    } catch (e) {
      print(e);
    }
  }

}

//@test
class Red extends StatefulWidget {
  @override
  _RedState createState() => _RedState();
}

class _RedState extends State<Red> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

//@test
class Blue extends StatefulWidget {
  @override
  _BlueState createState() => _BlueState();
}

class _BlueState extends State<Blue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

//refatorar later
 Text changeTitle(int index){
  if(index == 0) return Text('Dashboard');
  else if(index == 1) return Text('Galeria');
  else if(index == 2) return Text('Câmera');
  else if(index == 3) return Text('Lista de Predições');
  else return Text('Informações');
}

