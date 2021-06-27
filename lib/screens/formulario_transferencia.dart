import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloConta = 'Número da Conta';
const _dicaConta = '0000';
const _rotuloValor = 'Valor';
const _dicaValor = '0.00';
const _textoBotao = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTranferenciaState();
  }
}

class FormularioTranferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloConta,
              dica: _dicaConta,
            ),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloValor,
                dica: _dicaValor,
                icone: Icons.monetization_on),
            ElevatedButton(
                onPressed: () => {
                      _criaTransferencia(
                          context,
                          _controladorCampoNumeroConta.text,
                          _controladorCampoValor.text)
                    },
                child: Text(_textoBotao)),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context, numeroContaTxt, valordTxt) {
    final int? numeroConta = int.tryParse(numeroContaTxt);
    final double? valor = double.tryParse(valordTxt);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
