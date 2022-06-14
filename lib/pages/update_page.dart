
import 'package:flutter/material.dart';
import 'package:notes_app_flutter/datas/db_provider.dart';
import 'package:notes_app_flutter/datas/pegawai.dart';
import 'package:provider/provider.dart';

import 'main_page.dart';

class UpdatePage extends StatefulWidget {
  
  final Pegawai pegawai;
  const UpdatePage({required this.pegawai, Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jabatanController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _nameController.text = widget.pegawai.nama;
    _jabatanController.text = widget.pegawai.jabatan;
    _salaryController.text = widget.pegawai.penghasilan;
    _alamatController.text = widget.pegawai.alamat;
    _emailController.text = widget.pegawai.email;
    _phoneController.text = widget.pegawai.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Data Pegawai"),
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
                child: const Text('Ubah Data'),
                onPressed: () async {
                  final pegawai = Pegawai(
                    id: widget.pegawai.id,
                    nama: _nameController.text,
                    jabatan: _jabatanController.text,
                    penghasilan: _salaryController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    alamat: _alamatController.text,
                  );

                  DBProvider().updateData(pegawai);
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

  @override
  void dispose() {
    _nameController.dispose();
    _jabatanController.dispose();
    _salaryController.dispose();
    _emailController.dispose();
    _alamatController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}