import 'package:flutter/material.dart';

import '../../models/Administrative.dart';
import '../../services/administrative_service.dart';

class AdministrativeFormScreen extends StatefulWidget {
  final Administrative? parentAdministrative;

  AdministrativeFormScreen({required this.parentAdministrative});

  @override
  _AdministrativeFormScreenState createState() => _AdministrativeFormScreenState();
}

class _AdministrativeFormScreenState extends State<AdministrativeFormScreen> {
  final AdministrativeService _administrativeService = AdministrativeService();
  late TextEditingController _codeController;
  late TextEditingController _nameController;
  late TextEditingController _levelController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _nameController = TextEditingController();
    _levelController = TextEditingController();

    if (widget.parentAdministrative != null) {
      // Nếu có parentAdministrative, tức là từ màn hình AdministrativeScreen chọn viewChildren
      // Ta sẽ tự động gán parentId từ parentAdministrative.id
      _levelController.text = (widget.parentAdministrative!.level + 1).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.parentAdministrative == null ? 'Tạo mới' : 'Chỉnh sửa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.parentAdministrative != null) // Ẩn khi không có parentAdministrative
              Text('ParentId: ${widget.parentAdministrative!.id}'),
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
        parentId: widget.parentAdministrative?.id,
      );

      await _administrativeService.saveAdministrative(administrative);

      Navigator.pop(context);
    } catch (error) {
      print('Lỗi khi lưu đơn vị hành chính: $error');
    }
  }
}
