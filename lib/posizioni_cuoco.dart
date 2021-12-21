import 'package:flutter/material.dart';

import 'fine_condizionale.dart';
import 'main.dart';

class PosizioniCuoco extends StatefulWidget {
  const PosizioniCuoco({Key? key, required this.sedi, required this.candidato}) : super(key: key);
  final List sedi;
  final Persona candidato;

  @override
  _PosizioniCuocoState createState() => _PosizioniCuocoState();
}

class _PosizioniCuocoState extends State<PosizioniCuoco> {
  Map<String, String> posizione = {
    'Sede': '',
    'Titolo': '',
    'SottoTitolo': '',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posizioni Cuoco'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Selezionare la posizione per la quale ci si vuole candidare',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            (widget.sedi.contains('Milano') ||
                    widget.sedi.contains('Nessuna Preferenza'))
                ? Text('Posizioni a Milano:')
                : Container(),
            (widget.sedi.contains('Milano') ||
                    widget.sedi.contains('Nessuna Preferenza'))
                ? Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Cuoco Primi'),
                          subtitle: Text(
                              'Per la sede di milano si cerca un cuoco specializzato nei primi piatti della cucina milanese con ameno 5 anni di esperienza'),
                        ),
                        TextButton(
                            onPressed: () {
                              posizione.update("Sede", (existingValue) => 'Milano',);
                              posizione.update("Titolo", (existingValue) => 'Cuoco Primi',);
                              posizione.update("SottoTitolo", (existingValue) => 'Per la sede di milano si cerca un cuoco specializzato nei primi piatti della cucina milanese con ameno 5 anni di esperienza',);
                              print(posizione);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FineCondizione(posizione: posizione,candidato : widget.candidato)),
                              );
                            }, child: Text('Invia domanda'))
                      ],
                    ),
                  )
                : Container(),
            (widget.sedi.contains('Milano') ||
                widget.sedi.contains('Nessuna Preferenza'))
                ? Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Cuoco Secondi'),
                    subtitle: Text(
                        'Per la sede di milano si cerca un cuoco specializzato nei secondi piatti della cucina milanese con ameno 2 anni di esperienza'),
                  ),
                  TextButton(
                      onPressed: () {}, child: Text('Invia domanda'))
                ],
              ),
            )
                : Container(),
            (widget.sedi.contains('Roma') ||
                widget.sedi.contains('Nessuna Preferenza'))
                ? Text('Posizioni a Roma:')
                : Container(),
            (widget.sedi.contains('Roma') ||
                widget.sedi.contains('Nessuna Preferenza'))
                ? Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Cuoco Primi'),
                    subtitle: Text(
                        'Per la sede di roma si cerca un cuoco specializzato nei primi piatti della cucina romana, con almeno 2 anni di esperienza'),
                  ),
                  TextButton(
                      onPressed: () {}, child: Text('Invia domanda'))
                ],
              ),
            )
                : Container(),
          ],
        )
        //((widget.sedi.contains('Milano') && widget.sedi.contains('Roma')) || widget.sedi.contains('Nessuna preferenza')) ? Text(widget.sedi.first.toString()) : null,
        );
  }
}
