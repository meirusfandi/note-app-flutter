import 'package:flutter/material.dart';
import 'package:notes_app_flutter/datas/db_provider.dart';
import 'package:notes_app_flutter/datas/pegawai.dart';
import 'package:notes_app_flutter/pages/main_page.dart';
import 'package:provider/provider.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key}) : super(key: key);

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jabatanController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Data Pegawai"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name Pegawai'
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _jabatanController,
                decoration: const InputDecoration(
                  labelText: 'Jabatan Pegawai'
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _salaryController,
                decoration: const InputDecoration(
                  labelText: 'Penghasilan Pegawai'
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Alamat Email Pegawai'
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'No. Telepon Pegawai'
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _alamatController,
                decoration: const InputDecoration(
                  labelText: 'Alamat Domisili Pegawai'
                )
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Simpan Data'),
                onPressed: () async {
                  final pegawai = Pegawai(
                    nama: _nameController.text,
                    jabatan: _jabatanController.text,
                    penghasilan: _salaryController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    alamat: _alamatController.text,
                  );

                  DBProvider().insertPegawai(pegawai);
                  DBProvider().getAll();
                  Navigator.pushAndRemoveUntil(
                    context, 
                    MaterialPageRoute(builder: (context) => const MainPage()),
                    (route) => false
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}