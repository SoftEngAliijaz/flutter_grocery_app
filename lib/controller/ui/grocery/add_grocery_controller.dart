import 'package:file_picker/file_picker.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_form_validator.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

enum Category {
  Fruits,
  Vegetable,
  Dairy,
  Bakery,
  Snacks,
  Beverages,
  Rice;

  const Category();
}

enum Status {
  inStock,
  OutOfStock;

  const Status();
}

class AddGroceryController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();
  List<PlatformFile> files = [];
  Status? selectedStatus = Status.inStock;

  Future<void> pickFile() async {
    var result = await FilePicker.platform.pickFiles();
    if (result?.files[0] != null) {
      files.add(result!.files[0]);
    }
    update();
  }

  void onSelectedStatus(Status value) {
    selectedStatus = value;
    update();
  }

  void removeFile(PlatformFile file) {
    files.remove(file);
    update();
  }
}
