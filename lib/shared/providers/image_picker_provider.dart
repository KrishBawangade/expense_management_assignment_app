import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerProvider extends ChangeNotifier {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;
  bool _isImageCleared = false;

  XFile? get selectedImage => _selectedImage;
  bool get isImageCleared => _isImageCleared;

  Future<bool> _requestPermission(Permission permission) async {
    final status = await permission.status;

    if (status.isGranted) {
      return true;
    } else {
      final newStatus = await permission.request();
      return newStatus.isGranted;
    }
  }

  // captureImage() async {
  //   final hasPermission = await requestPermission(Permission.camera);

  //   if (hasPermission) {
  //     try {
  //       final XFile? image =
  //           await _imagePicker.pickImage(source: ImageSource.camera);

  //       if (image != null) {
  //         _selectedImage = image;
  //         notifyListeners();
  //       }
  //     } catch (e) {
  //       debugPrint("Error occurred while capturing the image: $e");
  //     }
  //   } else {
  //     debugPrint("Camera Permission denied!!");
  //   }

  // }

  pickImageFromGallery() async{
    final hasPermission = await _requestPermission(Permission.photos);

    if(hasPermission){
      try {
        final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);

        if(image!=null){
          _selectedImage = image;
          notifyListeners();
        }
      } catch (e) {
        debugPrint("Error occurred while picking images from gallery: $e");
      }
    }else{ 
        debugPrint("Permission denied for accessing the gallery!!");
    }

  }

  clearImage({bool listen = false}){
    _selectedImage = null;
    if(listen){
      notifyListeners();
    }
  }

  // ✅ Setter for isImageCleared
  setIsImageCleared(bool value, {bool listen = false}) {
    _isImageCleared = value;
    if (listen) notifyListeners();
  }
  
}
