import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class PackagesController extends BaseController {
  @override
  void errorHandler(e) {}
  RxInt radioSelected = 1.obs;
  String? radioVal;
  final TextEditingController titleController = TextEditingController();
}
