import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController{

  static Controller get to => Get.find();

  TextEditingController nameController = TextEditingController();

  var counter = 0;

  final isLoading = false.obs;

  List<String> userList = [];

  void increment(){
    counter++;
    update();
  }

  void changeValue(bool value){
    isLoading(value);
  }

  void addUser(String value){
    userList.add(value);
    update();
  }



  fetchApi(){
    print("value :- Api calling");
  }

  @override
  void onInit() {
    fetchApi();
    super.onInit();
  }
  
  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

}