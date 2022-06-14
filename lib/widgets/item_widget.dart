import 'package:flutter/material.dart';
import 'package:notes_app_flutter/datas/db_provider.dart';
import 'package:notes_app_flutter/datas/pegawai.dart';
import 'package:notes_app_flutter/pages/update_page.dart';

class ItemWidget extends StatefulWidget {
  
  Pegawai pegawai;
  DBProvider provider;

  ItemWidget({required this.pegawai, required this.provider, Key? key}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.pegawai.id.toString()),
      background: Container(color: Colors.red,),
      onDismissed: (direction) {
        widget.provider.deleteData(widget.pegawai.id!);
      },
      child: Card(
        child: ListTile(
          title: Text(widget.pegawai.nama),
          subtitle: Text(widget.pegawai.jabatan),
          onTap: () async {
            final dataPegawai = await widget.provider.getDetail(widget.pegawai.id!);
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) {
                  return UpdatePage(pegawai: dataPegawai);
                }
              )  
            );
          },
        ),
      ),
    );
  }
}