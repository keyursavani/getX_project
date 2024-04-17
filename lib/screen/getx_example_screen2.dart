import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_example/getx/home_controller.dart';


class GetXExampleSecondScreen extends GetView<HomeController>{
  const GetXExampleSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(),
     body: Column(
       children: [
         Center(
           child: Obx(() => Text(controller.count.toString())),
         ),
         ElevatedButton(
           onPressed: (){
             Get.toNamed('/second');
           },
           child: const Text("First page..."),
         ),
       ],
     ),
       floatingActionButton: FloatingActionButton(
         child: const Icon(Icons.add),
         onPressed: controller.increment,
       ),
   );
  }
}

class Second2 extends StatelessWidget {
  final HomeController controller = Get.find();

  Second2({super.key});
  @override
  Widget build(context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Obx(() => Text("Clicks :- ${controller.count}"))
          ),
          ElevatedButton(
              onPressed: (){
                Get.back();
              },
              child: const Text("Back...")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.increment();
          // count++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}