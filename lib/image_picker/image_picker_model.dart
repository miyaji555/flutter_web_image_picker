import 'dart:html';

import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';

class ImagePickerModel extends ChangeNotifier {
  String textMessage = 'initial';
  Uri imageURL;
  bool isLoading = false;

  Future _downloadUrl(String path) async {
    imageURL = await storage()
        .refFromURL('gs://flutterwebimagepicker.appspot.com/')
        .child('イラスト屋/$path')
        .getDownloadURL();
    print(imageURL);
  }

  Future<void> _pickupImage({@required Function(File file) onSelected}) {
    InputElement uploadInput = FileUploadInputElement()..accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
      });
    });
  }

  Future<void> uploadToStorage() async {
    final dateTime = DateTime.now();
    final path = 'dxOmk3FX0W3kywxAf29a/$dateTime';
    _pickupImage(
      onSelected: (file) async {
        isLoading = true;
        notifyListeners();
        await storage()
            .refFromURL('gs://flutterwebimagepicker.appspot.com/')
            .child('イラスト屋/$path')
            .put(file)
            .future;
        await _downloadUrl(path);
        isLoading = false;
        notifyListeners();
      },
    );
  }
}
