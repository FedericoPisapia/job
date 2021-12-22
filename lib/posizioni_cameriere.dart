import 'package:flutter/material.dart';

import 'fine_condizionale.dart';
import 'main.dart';

class PosizioniCameriere extends StatefulWidget {
  const PosizioniCameriere(
      {Key? key, required this.sedi, required this.candidato})
      : super(key: key);
  final List sedi;
  final Persona candidato;

  @override
  _PosizioniCameriereState createState() => _PosizioniCameriereState();
}

class _PosizioniCameriereState extends State<PosizioniCameriere> {
  Map<String, String> posizione = {
    'Sede': '',
    'Titolo': '',
    'SottoTitolo': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posizioni Cameriere'),
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
                          title: Text('Cameriere di sala'),
                          subtitle: Text(
                              'Per la sede di milano si cerca cameriere di sala con almeno 2 anni di esperienza'),
                        ),
                        TextButton(
                            onPressed: () {
                              posizione.update(
                                "Sede",
                                (existingValue) => 'Milano',
                              );
                              posizione.update(
                                "Titolo",
                                (existingValue) => 'Cameriere di sala',
                              );
                              posizione.update(
                                "SottoTitolo",
                                (existingValue) =>
                                    'Per la sede di milano si cerca cameriere di sala con almeno 2 anni di esperienza',
                              );
                              print(posizione);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FineCondizione(
                                        posizione: posizione,
                                        candidato: widget.candidato)),
                              );
                            },
                            child: Text('Invia domanda'))
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
                          title: Text('Maître'),
                          subtitle: Text(
                              'Per la sede di Milano si cerca Maitre con decennale esperienza'),
                        ),
                        TextButton(
                            onPressed: () {
                              posizione.update(
                                "Sede",
                                (existingValue) => 'Milano',
                              );
                              posizione.update(
                                "Titolo",
                                (existingValue) => 'Maître',
                              );
                              posizione.update(
                                "SottoTitolo",
                                (existingValue) =>
                                    'Per la sede di Milano si cerca Maitre con decennale esperienza',
                              );
                              print(posizione);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FineCondizione(
                                        posizione: posizione,
                                        candidato: widget.candidato)),
                              );
                            },
                            child: Text('Invia domanda'))
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
                          title: Text('Cameriere di sala'),
                          subtitle: Text(
                              'Per la sede di Roma, si cerca cameriere di sala con almeno 2 anni di esperienza'),
                        ),
                        TextButton(
                            onPressed: () {
                              posizione.update(
                                "Sede",
                                (existingValue) => 'Roma',
                              );
                              posizione.update(
                                "Titolo",
                                (existingValue) => 'Cameriere di sala',
                              );
                              posizione.update(
                                "SottoTitolo",
                                (existingValue) =>
                                    'Per la sede di Roma, si cerca cameriere di sala con almeno 2 anni di esperienza',
                              );
                              print(posizione);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FineCondizione(
                                        posizione: posizione,
                                        candidato: widget.candidato)),
                              );
                            },
                            child: Text('Invia domanda'))
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
