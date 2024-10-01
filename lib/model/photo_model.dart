// lib/models/photo_model.dart

import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PhotoModel {
  final String filePath;

  PhotoModel({required this.filePath});

  Future<String?> saveImage(File imageFile) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final String newPath = '${directory.path}/${DateTime.now()}.png';
      await imageFile.copy(newPath);
      return newPath;
    } catch (e) {
      print('Error em salvar a imagem: $e');
      return null;
    }
  }
}
