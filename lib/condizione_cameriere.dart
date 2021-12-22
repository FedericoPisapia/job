import 'package:flutter/material.dart';
import 'package:job/posizioni_cameriere.dart';
import 'package:job/posizioni_cuoco.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'main.dart';

//https://flutter-examples.com/get-multiple-checkbox-checked-value-in-flutter/

class CondizioneCameriere extends StatefulWidget {
  const CondizioneCameriere({Key? key, required this.candidato})
      : super(key: key);
  final Persona candidato;

  @override
  _CondizioneCameriereState createState() => _CondizioneCameriereState();
}

class _CondizioneCameriereState extends State<CondizioneCameriere> {
  Map<String, bool> values = {
    'Milano': false,
    'Roma': false,
    'Nessuna Preferenza': false,
  };

  List tmpArray = [];
  bool val = false;

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });
    List sedi = tmpArray;
    print(tmpArray.isEmpty);
    if (!tmpArray.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PosizioniCameriere(sedi: sedi, candidato: widget.candidato)),
      );
    } else {
      setState(() {
        val = true;
      });
    }

    print(tmpArray);
    tmpArray = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cameriere')),
      body: Column(children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(
          'Seleziona sede',
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: 50,
        ),
        Flexible(
          child: ListView(
            children: values.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key),
                value: values[key],
                activeColor: Colors.pink,
                checkColor: Colors.white,
                onChanged: (bool? value) {
                  setState(() {
                    values[key] = value!;
                  });
                },
              );
            }).toList(),
          ),
        ),
        ElevatedButton(
            child: Text(
              "Visualizza posizioni",
              style: TextStyle(fontSize: 18),
            ),
            onPressed: getCheckboxItems),
        if (val) Text('inserisci una preferenza'),
        SizedBox(
          height: 200,
        ),
      ]),
    );
  }
}
