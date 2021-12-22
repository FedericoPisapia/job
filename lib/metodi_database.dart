import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';

import 'main.dart';

Future<void> addUser(
  Persona candidato,
  String sede,
  String url, String candidatura,
) {

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  return users
      .add({
        'Nome': candidato.Nome,
        'Cognome': candidato.Cognome,
        'Email': candidato.Email,
        'Data': candidato.Data,
        'Telefono': candidato.Telefono,
        'Posizione': candidato.Posizione,
        'Titolo': candidato.Titolo,
        'Sede': sede,
        'UrlPdf': url,
        'Candidatura' : candidatura,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<bool> Upload(Persona candidato) async {
  String path = 'CV/' + candidato.Nome + '_' + candidato.Cognome + '_' + candidato.Telefono;
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: [
      'pdf',
      'doc',
    ],
  );
  if (result != null) {
    File file = File(result.files.single.path!);

    await firebase_storage.FirebaseStorage.instance.ref(path).putFile(file);
    //var url = await downloadURL().toString();
    //print(url);
    return true;
  }
  return false;
}

Future<String> downloadURL(Persona candidato) async {
  String path = 'CV/' + candidato.Nome + '_' + candidato.Cognome + '_' + candidato.Telefono;
  String downloadURL = await firebase_storage.FirebaseStorage.instance
      .ref(path)
      .getDownloadURL();
  print(downloadURL);

  return downloadURL.toString();
}
