import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FunctionImagePicker {
  static Future<File?> cameraicker({XFile? image}) async {
    image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }

  static Future<File?> galluryicker({XFile? image}) async {
    PermissionStatus status;
    if (Platform.isAndroid) {
      final androidnfo = await DeviceInfoPlugin().androidInfo;
      if (androidnfo.version.sdkInt <= 32) {
        status = await Permission.storage.request();
      } else {
        status = await Permission.phone.request();
      }
    } else {
      status = await Permission.phone.request();
    }
    if (status.isGranted) {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return File(image.path);
      } else {
        return null;
      }
    }
    return null;
  }
}
