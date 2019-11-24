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
        new Red(),
        new Blue()
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
          icon: Icon(Icons.camera_alt, color: Colors.white, size: 30),
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
  if(index == 0) return Text('DashBoard');
  else if(index == 1) return Text('Galeria');
  else if(index == 2) return Text('Câmera');
  else if(index == 3) return Text('Predições');
  else return Text('Info');
}