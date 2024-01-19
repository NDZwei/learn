import 'package:dio_api/services/administrative_service.dart';
import 'package:flutter/material.dart';

import '../../models/Administrative.dart';

class AdministrativeDetail extends StatefulWidget {
  final int? id;

  const AdministrativeDetail({Key? key, this.id}) : super(key: key);

  @override
  AdministrativeDetailState createState() => AdministrativeDetailState();
}

class AdministrativeDetailState extends State<AdministrativeDetail> {
  final AdministrativeService _administrativeService = AdministrativeService();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    try {
      final administrative = await _administrativeService.getAdministrative(widget.id!);
      _codeController.text = administrative.code;
      _nameController.text = administrative.name;
      _levelController.text = administrative.level.toString();
    } catch (error) {
      print('Error loading administrative details: $error');
    }
  }

  Future<void> _saveData() async {
    try {
      Administrative administrative = Administrative(
        id: widget.id ?? 0,
        code: _codeController.text,
        name: _nameController.text,
        level: int.parse(_levelController.text),
      );

      await _administrativeService.saveAdministrative(administrative);

      Navigator.of(context).pop();
    } catch (error) {
      print('Error saving administrative details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id != null ? 'Edit Administrative' : 'Add New Administrative'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              decoration: InputDecoration(labelText: 'Code'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _levelController,
              decoration: InputDecoration(labelText: 'Level'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
