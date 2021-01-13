import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textEditingControllerAlcool = new TextEditingController();
  TextEditingController _textEditingControllerGasolina = new TextEditingController();
  String _textoResultado = "";

  void _calcular(){

    double precoAlcool = double.tryParse(_textEditingControllerAlcool.text);
    double precoGasolina = double.tryParse(_textEditingControllerGasolina.text);

    //valida se o numero passado pelo usuário é valido
    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = 'Numero invalido, por favor digite um numero maior que 0 e com o (.) nas casas decimais';
      });
    }else{
      /*
      em média um carro tem um desenpenho de 30% a mais com gasolina,
      se o valor da gasolina estiver 70% mais caro que o alcool compensa abastecer com
      alcool, caso contrário com gasolina
       */
      if((precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = 'Melhro Abastecer com Gasolina';
        });
      }else{
        setState(() {
          _textoResultado = 'Melhro Abastecer com Alcool';
        });
      }
    }

    _limparCampo();

  }

  void _limparCampo(){
    _textEditingControllerGasolina.text = "";
    _textEditingControllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alcool ou Gasolina'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset('images/logo.png'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Saiba qual a melhor opção para abastecimento do seu carro',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Alcool ex 2.89"
                ),
                style: TextStyle(
                    fontSize: 20
                ),
                controller: _textEditingControllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina ex 3.89"
                ),
                style: TextStyle(
                  fontSize: 20
                ),
                controller: _textEditingControllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top:  10),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      'Calcular',
                      style: TextStyle(
                        fontSize: 20,
                      )
                  ),

                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style:  TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
