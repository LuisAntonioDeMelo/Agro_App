import 'package:flutter/material.dart';
import 'home.dart';

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
  int menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Center(child: Text('Dashboard')),
            backgroundColor: Colors.lightGreen),
        body: pageWiew(),
        bottomNavigationBar: menuNav(menuIndex),
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
    var pageView = PageView(
        controller: page,
        onPageChanged: (index) {
          pageChange(index);
        },
        //TODO:Importar paginas aqui!!! [0,1,2,3...]
        children: <Widget>[
          new HomeConteudo()    
        ],
      );
    return pageView;
  }

  void pageChange(int index) {
    setState(() {
      menuIndex = index;
    });
  }

  void tap(var index) {
    setState(() {
      menuIndex = index;
      page.animateTo(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

//navegação de items ps --refac extrair para o shared ....
  Widget menuNav(int index) => BottomNavigationBar(
        currentIndex: index,
        onTap: (index) {
          tap(index);
        },
        items: menuItensNav(),
      );

  List<BottomNavigationBarItem> menuItensNav() => [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: Colors.white),
          title: Text('Inicio'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.collections, color: Colors.white),
          title: Text('Galeria'),
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.photo_camera,color: Colors.white),
          title: Text('Câmera'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.format_list_bulleted, color: Colors.white),
          title: Text('Predições'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info,color: Colors.white),
          title: Text('Info'),
        ),
      ];
//fim dash
}
