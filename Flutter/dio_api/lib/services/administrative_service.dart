import 'package:dio/dio.dart';

import '../models/Administrative.dart';
import '../utils/constants.dart';

class AdministrativeService {
  Dio _dio = Dio();
  final String baseUrl = DioConstants.URL_ADMINISTRATIVE;

  Future<List<Administrative>> getAllProvince() async {
    try {
      print("===========All Province===========");
      final response = await _dio.get('$baseUrl/all-province');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> data = responseData['data'];
        List<Administrative> results = data.map((item) => Administrative.fromJson(item)).toList();
        return results;
      } else {
        throw Exception('Failed to load administrative');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<List<Administrative>> getAllByParent(int parentId) async {
    try {
      print("===========All children===========");
      final response = await _dio.get('$baseUrl/get-by-parent/$parentId');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> data = responseData['data'];
        List<Administrative> results = data.map((item) => Administrative.fromJson(item)).toList();
        return results;
      } else {
        throw Exception('Failed to load administrative');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<Administrative> getAdministrative(int id) async {
    try {
      print("===========Administrative by id===========");
      final response = await _dio.get('$baseUrl/$id');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data['data'];
        return Administrative.fromJson(data);
      } else {
        throw Exception('Failed to load administrative by ID');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<void> saveAdministrative(Administrative administrative) async {
    try {
      print("===========Administrative save===========");
      await _dio.post('$baseUrl/save', data: administrative.toJson());
    } catch (error) {
      throw Exception('Error adding administrative: $error');
    }
  }

  Future<void> deleteAdministrative(int id) async {
    try {
      print("===========Administrative delete===========");
      await _dio.delete('$baseUrl/$id');
    } catch (error) {
      throw Exception('Error deleting administrative: $error');
    }
  }
}
