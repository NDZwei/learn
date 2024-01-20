import 'package:dio_api/screens/administrative/detail.dart';
import 'package:dio_api/services/administrative_service.dart';
import 'package:flutter/material.dart';

import '../../models/Administrative.dart';

class AdministrativeChildren extends StatefulWidget {
  final int parentId;
  final String parentName;

  const AdministrativeChildren({
    Key? key,
    required this.parentId,
    required this.parentName}) : super(key: key);

  @override
  _AdministrativeChildrenState createState() => _AdministrativeChildrenState();
}

class _AdministrativeChildrenState extends State<AdministrativeChildren> {
  final AdministrativeService _administrativeService = AdministrativeService();
  List<Administrative> childrens = [];

  @override
  void initState() {
    super.initState();
    _loadChildren();
  }

  Future<void> _loadChildren() async {
    try {
      final data = await _administrativeService.getAllByParent(widget.parentId);
      setState(() {
        childrens = data;
      });
    } catch (error) {
      print('Error loading children administratives: $error');
    }
  }

  Future<void> _showForm(Administrative? administrative) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdministrativeDetail(id: administrative?.id),
      ),
    );
    _loadChildren();
  }

  Future<void> _showDeleteConfirmationDialog(Administrative administrative) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận xóa'),
          content: Text('Bạn có chắc chắn muốn xóa ${administrative.name} không?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () async {
                await _administrativeService.deleteAdministrative(administrative.id!);
                Navigator.of(context).pop();
                _loadChildren();
              },
              child: Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách Huyện/Quận - ${widget.parentName}'),
      ),
      body: ListView.builder(
        itemCount: childrens.length,
        itemBuilder: (context, index) {
          final administrative = childrens[index];
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(administrative.name),
              onTap: () {
                _showForm(administrative);
              },
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showForm(administrative);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(administrative);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showForm(null);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
