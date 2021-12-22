import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'metodi_database.dart';

class FineCondizione extends StatefulWidget {
  const FineCondizione(
      {Key? key, required this.posizione, required this.candidato})
      : super(key: key);
  final Map<String, String> posizione;
  final Persona candidato;

  @override
  _FineCondizioneState createState() => _FineCondizioneState();
}

class _FineCondizioneState extends State<FineCondizione> {
  String url = '';
  bool cv = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fine'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Riassunto:'),
          SizedBox(
            height: 20,
          ),
          Text('Nome : ' + widget.candidato.Nome),
          Text('Cognome : ' + widget.candidato.Cognome),
          Text('Email : ' + widget.candidato.Email),
          Text('Telefono : ' + widget.candidato.Telefono),
          Text('Data : ' + widget.candidato.Data),
          Text('Titolo : ' + widget.candidato.Titolo),
          Text('Posizione : ' + widget.candidato.Posizione),
          Text('Sede Posizione : ' + widget.posizione.values.elementAt(0)),
          Text('Posizione : ' +
              widget.posizione.values.elementAt(1) +
              '. ' +
              widget.posizione.values.elementAt(2)),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () async {
                cv = await Upload(widget.candidato);
                url = await downloadURL(widget.candidato);
                setState(() {});
              },
              child: Text('Carica il tuo cv')),
          (cv) ? Text('CV caricato correttamente') : Container(),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      addUser(widget.candidato,
                          widget.posizione.values.elementAt(0), url , widget.posizione.values.elementAt(1) +
                              '. ' +
                              widget.posizione.values.elementAt(2));
                    },
                    child: Text('INVIA')),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text('RESET'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
