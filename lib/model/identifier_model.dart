import 'package:flutter_grocery_app/model/model.dart';

abstract class IdentifierModel<T> extends Model {
  final int id;

  IdentifierModel(this.id);
}
