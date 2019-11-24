import 'package:agro_app/dash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* 
  @author :Luis Antônio 
  //Pagina princinpal de login
*/
class PaginaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[FundoLogo(), FormularioWig()],
          ),
        ),
      ),
    );
  }
}

class FundoLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 1.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightGreen, Colors.green],
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(89),
       )),
      child: Center(
          child: Image(
        image: AssetImage('imagens/logo_agro.png'),
        width: MediaQuery.of(context).size.width / 1.8,
      )),
    );
  }
}

class FormularioWig extends StatefulWidget {
  FormularioState createState() => FormularioState();
}

class FormularioState extends State<FormularioWig> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60),
      child: Column(
        children: <Widget>[
          new EmailInputContainer(),
          SizedBox(height: 20),
          new SenhaInputContainer(),
          SizedBox(height: 20),
          new AcessarButtonContainer(),
          SizedBox(height: 10),
          new EsqueceuButtonContainer(),
          SizedBox(height: 15),
          Container(
            child: MaterialButton(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Não possui cadastro ? ',style:TextStyle(color:Colors.black45),),
                    Text('Cadastre-se.',style: TextStyle(color: Colors.blue[400]),)
                  ],
                ),
              ),
              onPressed: () {
                print('Cadastrar novo Usuario!');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EmailInputContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
      child: TextField(
        decoration: InputDecoration(
            icon: Icon(
              Icons.email,
              color: Colors.lightGreen,
            ),
            hintText: "E-mail",
            border: InputBorder.none),
      ),
    );
  }
}

class SenhaInputContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
      child: TextField(
        decoration: InputDecoration(
            icon: Icon(
              Icons.vpn_key,
              color: Colors.lightGreen,
            ),
            hintText: "Senha",
            border: InputBorder.none),
      ),
    );
  }
}

class EsqueceuButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        child: Text(
          'Esqueceu sua senha ?',
          style: TextStyle(color: Colors.black38),
        ),
        onPressed: () {
          print('direcionar para tela de recuperação');
        },
      ),
    );
  }
}

class AcessarButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomCenter,
          colors: [Colors.green, Colors.lightGreen],
        ),
      ),
      child: MaterialButton(
        child: Center(
          child: Text(
            'Acessar',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPressed: () {
          print('logar para dash');
          if(true){
            Navigator.push(context,MaterialPageRoute(builder: (context)=> DashBoard()));
          }
        },
      ),
    );
  }
}
