// lib/controllers/photo_controller.dart

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../model/photo_model.dart';

class Controller {
  final ImagePicker _picker = ImagePicker();
  File? image; // Armazena a imagem capturada

  Future<void> abrirCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path); // Armazena a imagem capturada
    }
  }

  Future<String?> salvarFoto() async {
    if (image != null) {
      final photoModel = PhotoModel(filePath: image!.path);
      return await photoModel.saveImage(image!);
    }
    return null;
  }

  pickImage() {}

  saveImage(PhotoModel photoModel) {}
}
