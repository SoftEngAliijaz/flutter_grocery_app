import 'package:flutter_grocery_app/helpers/widgets/my_base_exception.dart';

class RouteException extends BaseException {
  RouteException(this.message);

  final String message;

  @override
  String toString() {
    return 'RouteException{message: $message}';
  }
}
