import 'package:dio_api/screens/administrative/detail.dart';
import 'package:dio_api/services/administrative_service.dart';
import 'package:flutter/material.dart';

import '../../models/Administrative.dart';

class AdministrativeIndex extends StatefulWidget {
  @override
  AdministrativeIndexState createState() => AdministrativeIndexState();
}

class AdministrativeIndexState extends State<AdministrativeIndex> {
  final AdministrativeService _administrativeService = AdministrativeService();
  List<Administrative> administratives = [];

  @override
  void initState() {
    super.initState();
    _loadAdministratives();
  }

  Future<void> _loadAdministratives() async {
    try {
      final data = await _administrativeService.getAllProvince();
      setState(() {
        administratives = data;
      });
    } catch (error) {
      print('Error loading administratives: $error');
    }
  }

  Future<void> _showForm(Administrative? administrative) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdministrativeDetail(id: administrative?.id),
      ),
    );
    _loadAdministratives(); // Reload the list after form is closed
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
                Navigator.of(context).pop(); // Close the dialog
                _loadAdministratives(); // Reload the list after deletion
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
        title: Text('Danh sách Tỉnh/Thành phố'),
      ),
      body: ListView.builder(
        itemCount: administratives.length,
        itemBuilder: (context, index) {
          final administrative = administratives[index];
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
