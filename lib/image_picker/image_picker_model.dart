import 'dart:html';

import 'package:firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ImagePickerModel extends ChangeNotifier {
  String textMessage = 'initial';
  Uri imageURL;

  void fetch() {
    final instanse = FirebaseFirestore.instance;
    final snapshot =
        instanse.collection('user').doc('dxOmk3FX0W3kywxAf29a').snapshots();
    snapshot.listen((event) async {
      textMessage = await event.data()['testfield'];
      print(event);
      print(event.data()['testfield']);
      notifyListeners();
    });
  }

  Future downloadUrl() async {
    imageURL = await storage()
        .refFromURL('gs://flutterwebimagepicker.appspot.com/')
        .child('イラスト屋/oomisoka_yoiotoshio_summer_woman.png')
        .getDownloadURL();
    print(imageURL);
    notifyListeners();
  }
}
