import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_web_image_picker/image_picker/image_picker_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImagePickerPage(),
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}

//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//  String message = '';
//
//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }

//  void fetch() {
//    setState(() {
//      final instanse = FirebaseFirestore.instance;
//      final snapshot =
//          instanse.collection('user').doc('dxOmk3FX0W3kywxAf29a').snapshots();
//      snapshot.listen((event) async {
//        message = await event.data()['testfield'];
//        print(event);
//        print(event.data()['testfield']);
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Text(
//          message,
//          style: Theme.of(context).textTheme.headline4,
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: fetch,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
