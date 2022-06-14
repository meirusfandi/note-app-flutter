import 'package:flutter/material.dart';
import 'package:notes_app_flutter/datas/db_provider.dart';
import 'package:notes_app_flutter/pages/insert_page.dart';
import 'package:notes_app_flutter/pages/main_page.dart';
import 'package:notes_app_flutter/pages/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pegawai',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      // routes: <String, WidgetBuilder> {
      //   'main': (BuildContext context) => const MainPage(),
      //   'insert': (BuildContext context) => const InserPage(),
      //   'update': (BuildContext context) => const UpdatePage(),
      // },
    );
  }
}