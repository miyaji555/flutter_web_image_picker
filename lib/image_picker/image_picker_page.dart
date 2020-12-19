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
              color: Colors.black12,
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://1.bp.blogspot.com/-kgcAHrla1MM/WkR96Ewyx2I/AAAAAAABJWA/feKfyDf44J4xQObtAu8WXWsxT8Osk-ucQCLcBGAs/s800/oomisoka_yoiotoshio_summer_woman.png')),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
