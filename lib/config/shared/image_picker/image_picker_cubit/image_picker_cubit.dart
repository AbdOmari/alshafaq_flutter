import 'dart:io';
import 'package:ashafaq/config/shared/image_picker/image_picker_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerCubit extends Cubit<File?> {
  static File? _pickedImage;
  ImagePickerCubit() : super(null);
  void pickImage({required bool fromCamera}) async {
    final file = await ImagePickerService.pickImage(fromCamera: fromCamera);
    if (file != null) {
      final File image = File(file.path);
      _pickedImage = image;
    }
    emit(_pickedImage);
  }
}
