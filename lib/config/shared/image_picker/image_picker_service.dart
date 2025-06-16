import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static final ImagePicker _imagePicker = ImagePicker();
  static Future<XFile?> pickImage({required bool fromCamera}) async {
    final ImageSource source =
        fromCamera ? ImageSource.camera : ImageSource.gallery;
    final file = await _imagePicker.pickImage(source: source);
    
    return file;
  }
}
