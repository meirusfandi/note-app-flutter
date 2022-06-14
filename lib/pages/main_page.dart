import 'package:flutter/material.dart';
import 'package:notes_app_flutter/datas/db_provider.dart';
import 'package:notes_app_flutter/pages/insert_page.dart';
import 'package:notes_app_flutter/widgets/item_widget.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DBProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Aplikasi Pegawai'),
        ),
        body: Consumer<DBProvider>(
          builder: (context, provider, child) {
            final pegawai = provider.pegawai;

            return ListView.builder(
              itemCount: pegawai.length,
              itemBuilder: (context, index) {
                final data = pegawai[index];
                return ItemWidget(pegawai: data, provider: provider);
              }
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const InsertPage()));
          },
        ),
      ),
    );
  }
}