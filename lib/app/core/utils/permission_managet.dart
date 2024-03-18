import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  static bool _storagePermissionRequested = false;
  static bool _cameraPermissionRequested = false;

  static Future<void> checkRequestPermissions() async {
    if (!_storagePermissionRequested) {
      await _requestStoragePermission();
    }

    if (!_cameraPermissionRequested) {
      await _requestCameraPermission();
    }
  }

  static Future<void> _requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
      _storagePermissionRequested = true;
    }
  }

  static Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
      _cameraPermissionRequested = true;
    }
  }
}
