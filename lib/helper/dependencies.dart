import 'package:get/get.dart';
import 'package:imt_test/controller/BookController.dart';

Future<void> init() async {
  ///controller
  Get.lazyPut(() => BookController());
}