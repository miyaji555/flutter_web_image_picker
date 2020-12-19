import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_web_image_picker/image_picker/image_picker_model.dart';
import 'package:provider/provider.dart';

class ImagePickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImagePickerModel>(
      create: (context) => ImagePickerModel(),
      builder: (context, child) {
        return Consumer<ImagePickerModel>(builder: (context, model, child) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(model.textMessage),
                  Center(
                      child: RaisedButton(
                    onPressed: model.fetch,
                  )),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
