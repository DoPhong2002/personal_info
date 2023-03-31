
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class MyController extends GetxController {
  bool isSelected = false;
  String selectedImagePath = '';
  String selectedAddress = '';
  bool isExpanded = false;
  void click() {
    isSelected = !isSelected;
    update();
  }

void onTapAddress(String s){
    selectedAddress = s;
    update();
}
void onTapMenu(){
  isExpanded = !isExpanded;
  update();
}

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
