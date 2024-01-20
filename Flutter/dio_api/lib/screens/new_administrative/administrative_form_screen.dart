import 'package:flutter/material.dart';

import '../../models/Administrative.dart';
import '../../services/administrative_service.dart';

class AdministrativeFormScreen extends StatefulWidget {
  final Administrative? administrative;

  AdministrativeFormScreen({this.administrative});

  @override
  _AdministrativeFormScreenState createState() => _AdministrativeFormScreenState();
}

class _AdministrativeFormScreenState extends State<AdministrativeFormScreen> {
  final AdministrativeService _administrativeService = AdministrativeService();
  late TextEditingController _codeController;
  late TextEditingController _nameController;
  late TextEditingController _levelController;
  late TextEditingController _parentIdController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: widget.administrative?.code ?? '');
    _nameController = TextEditingController(text: widget.administrative?.name ?? '');
    _levelController = TextEditingController(text: widget.administrative?.level.toString() ?? '');
    _parentIdController = TextEditingController(text: widget.administrative?.parentId?.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.administrative == null ? 'Tạo mới' : 'Chỉnh sửa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _codeController,
              decoration: InputDecoration(labelText: 'Mã'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Tên'),
            ),
            TextField(
              controller: _levelController,
              decoration: InputDecoration(labelText: 'Cấp độ'),
            ),
            TextField(
              controller: _parentIdController,
              decoration: InputDecoration(labelText: 'ID cha'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _saveAdministrative(),
              child: Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveAdministrative() async {
    try {
      Administrative administrative = Administrative(
        code: _codeController.text,
        name: _nameController.text,
        level: int.parse(_levelController.text),
        parentId: _parentIdController.text.isNotEmpty ? int.parse(_parentIdController.text) : null,
      );

      if (widget.administrative == null) {
        await _administrativeService.saveAdministrative(administrative);
      } else {
        administrative.id = widget.administrative!.id;
        await _administrativeService.saveAdministrative(administrative);
      }
      Navigator.pop(context);
    } catch (error) {
      print('Lỗi khi lưu đơn vị hành chính: $error');
    }
  }
}
