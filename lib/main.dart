import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'condizione_cameriere.dart';
import 'condizione_cuoco.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum TitoloDiStudio { Diploma, Laurea }
enum PosizioneAperte { Cuoco, Cameriere }

class  Persona {
  String Nome;

  String Cognome;

  String Email;

  String Telefono;

  String Data;

  String Titolo;

  String Posizione;

  Persona(this.Nome, this.Cognome, this.Email, this.Telefono, this.Data,
      this.Titolo, this.Posizione);
}

class _MyHomePageState extends State<MyHomePage> {
  TitoloDiStudio? _titoloDiStudio = TitoloDiStudio.Diploma;
  PosizioneAperte? _posizioneAperte = PosizioneAperte.Cuoco;
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Diploma';
  String Nome = '';
  String Cognome = '';
  String Email = '';
  String Telefono = '';
  String Data = '';
  String Titolo = '';
  String Posizione = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invia la candidatura'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (text) {
                      Nome = text;
                    },
                    decoration: InputDecoration(labelText: "Nome"),
                    validator: (nome) {
                      if (nome == null || nome.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!RegExp(r"[a-zA-Z]").hasMatch(nome)) {
                        return 'Please enter correct text';
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (text) {
                      Cognome = text;
                    },
                    decoration: InputDecoration(labelText: "Cognome"),
                    validator: (cognome) {
                      if (cognome == null || cognome.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!RegExp(r"[a-zA-Z]").hasMatch(cognome)) {
                        return 'Please enter correct text';
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (text) {
                      Email = text;
                    },
                    decoration: InputDecoration(labelText: "Email"),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email)) {
                        return 'Please enter correct text';
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (text) {
                      Telefono = text;
                    },
                    decoration: InputDecoration(labelText: "Telefono"),
                    validator: (telefono) {
                      if (telefono == null || telefono.isEmpty) {
                        return 'Please enter some text';
                      }

                      if (!RegExp(r"[0-9]").hasMatch(telefono)) {
                        return 'Please enter correct text';
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (text) {
                      Data = text;
                    },
                    decoration: InputDecoration(labelText: "Data di nascit??"),
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!RegExp(
                              r"^(?:(?:31(/.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(/.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(/.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(/)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$")
                          .hasMatch(data)) {
                        return 'Please enter correct text';
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Text('Titolo di studio'),
                  ListTile(
                    title: const Text('Diploma'),
                    leading: Radio<TitoloDiStudio>(
                      value: TitoloDiStudio.Diploma,
                      groupValue: _titoloDiStudio,
                      onChanged: (TitoloDiStudio? value) {
                        setState(() {
                          _titoloDiStudio = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Laurea'),
                    leading: Radio<TitoloDiStudio>(
                      value: TitoloDiStudio.Laurea,
                      groupValue: _titoloDiStudio,
                      onChanged: (TitoloDiStudio? value) {
                        setState(() {
                          _titoloDiStudio = value;
                        });
                      },
                    ),
                  ),
                  Text('Posizioni aperte'),
                  ListTile(
                    title: const Text('Cuoco'),
                    leading: Radio<PosizioneAperte>(
                      value: PosizioneAperte.Cuoco,
                      groupValue: _posizioneAperte,
                      onChanged: (PosizioneAperte? value) {
                        setState(() {
                          _posizioneAperte = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Cameriere'),
                    leading: Radio<PosizioneAperte>(
                      value: PosizioneAperte.Cameriere,
                      groupValue: _posizioneAperte,
                      onChanged: (PosizioneAperte? value) {
                        setState(() {
                          _posizioneAperte = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );

                          Posizione = _posizioneAperte
                              .toString()
                              .replaceAll('PosizioneAperte.', '');
                          Titolo = _titoloDiStudio
                              .toString()
                              .replaceAll('TitoloDiStudio.', '');
                          Persona candidato = Persona(Nome,Cognome, Email, Telefono, Data, Titolo, Posizione);
                          if (Posizione == 'Cuoco') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CondizioneCuoco(candidato:candidato)),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CondizioneCameriere(candidato:candidato)),
                            );
                          }
                        }
                      },
                      child: const Text('Avanti'),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
