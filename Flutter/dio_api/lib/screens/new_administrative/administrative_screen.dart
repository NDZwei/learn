import 'package:flutter/material.dart';

import '../../models/Administrative.dart';
import '../../services/administrative_service.dart';
import 'administrative_form_screen.dart';
import 'administrative_list_item.dart';

class AdministrativeScreen extends StatefulWidget {
  final int? parentId;
  final List<Administrative>? children;

  AdministrativeScreen({this.parentId, this.children});

  @override
  _AdministrativeScreenState createState() => _AdministrativeScreenState();
}

class _AdministrativeScreenState extends State<AdministrativeScreen> {
  final AdministrativeService _administrativeService = AdministrativeService();
  late List<Administrative> _administratives;

  @override
  void initState() {
    super.initState();
    _administratives = []; // Khởi tạo danh sách rỗng
    if (widget.children != null) {
      _administratives.addAll(widget.children!);
    } else {
      _loadData(); // Nếu không có dữ liệu con, load dữ liệu ban đầu
    }
  }

  Future<void> _loadData() async {
    try {
      List<Administrative> data = await _administrativeService.getAllProvince();
      setState(() {
        _administratives = data;
      });
    } catch (error) {
      print('Lỗi khi lấy danh sách đơn vị hành chính: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách đơn vị hành chính'),
      ),
      body: ListView.builder(
        itemCount: _administratives.length,
        itemBuilder: (context, index) {
          Administrative administrative = _administratives[index];
          return AdministrativeListItem(
            administrative: administrative,
            onEdit: () => _navigateToEditScreen(administrative),
            onDelete: () => _deleteAdministrative(administrative.id!),
            onViewChildren: () => _viewChildren(administrative),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToCreateScreen(),
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToCreateScreen() {
    print('Click create screen');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdministrativeFormScreen(parentAdministrative: null)),
    );
  }

  void _navigateToEditScreen(Administrative administrative) {
    print('Click edit screen');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdministrativeFormScreen(parentAdministrative: administrative)),
    );
  }

  void _deleteAdministrative(int id) async {
    print('Click delete');
    try {
      await _administrativeService.deleteAdministrative(id);
      setState(() {});
    } catch (error) {
      print('Lỗi khi xóa đơn vị hành chính: $error');
    }
  }

  void _viewChildren(Administrative administrative) {
    print('View children');
    _getChildren(administrative);
  }

  Future<void> _getChildren(Administrative administrative) async {
    try {
      List<Administrative> children = await _administrativeService.getAllByParent(administrative.id!);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdministrativeScreen(children: children)),
      );
    } catch (error) {
      print('Lỗi khi lấy danh sách đơn vị con: $error');
    }
  }
}
