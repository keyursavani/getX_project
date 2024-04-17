
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_example/getx/bindings.dart';
import 'package:tree_example/getx/getx_controller.dart';
import 'package:tree_example/screen/getx_example_screen2.dart';

void main(){
  runApp( const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      // initialRoute: '/home',
      // getPages: [
      //   GetPage(name: '/home', page: () => const GetXExampleSecondScreen(), binding: HomeBinding()),
      //   GetPage(name: '/second', page: () =>  Second2(), binding: HomeBinding()),
      // ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return MyHomePageState();
  }
}
class MyHomePageState extends State<MyHomePage>{

  var controller = Get.put(Controller());
  // var count = 0.obs;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
          child: Center(
            child:Column(
              children: [
                GetBuilder<Controller>(
                   builder: (_){
                  return Text("Clicks :- ${controller.counter}");
                }),
                ElevatedButton(
                    onPressed: (){
                      Get.to(Second());
                    },
                    child: const Text("Next page"),
                ),
                const SizedBox(height: 50,),
                Obx(() => Text(controller.isLoading.toString())),
                // GetBuilder(builder: (_) => Text(controller.isLoading.toString())),
                const SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: (){
                   controller.changeValue(true);
                  },
                  child: const Text("Toggle"),
                ),
              ],
            )
            // Obx(() {
            //   return Text("$count");
            // }),
          ),
        ),
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

class Second extends StatelessWidget {
  final Controller controller = Get.find();

   Second({super.key});
  @override
  Widget build(context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: (){
              Focus.of(context).unfocus();
            },
            onTapDown: (state){
              Focus.of(context).unfocus();
            },
            onTapUp: (state){
              Focus.of(context).unfocus();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: GetBuilder<Controller>(
                    init: Controller(),
                      builder: (_){
                        return Text("Clicks :- ${controller.counter}");
                      }),
                ),
                ElevatedButton(
                    onPressed: (){
                      Get.back();
                    },
                    child: const Text("Back")),
                const SizedBox(height: 50,),
                Obx(() => Text(controller.isLoading.toString())),
                // GetBuilder(builder: (_) => Text(controller.isLoading.toString())),
                const SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: (){
                    controller.changeValue(false);
                  },
                  child: const Text("Toggle"),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: TextFormField(
                    controller: controller.nameController,
                  ),
                ),
                const SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: (){
                    if(controller.nameController.text != null && controller.nameController.text.isNotEmpty){
                      controller.addUser(controller.nameController.text.trim().toString());
                      if(controller.userList.contains("k")){
                        print("value :- true");
                        // controller.userList.insert(3, "keyur s");
                        controller.userList.remove("m");
                        print("List Length :- ${controller.userList.length.toString()}");
                      }
                      else{
                        print("value :- false");
                      }
                    }
                    controller.nameController.clear();
                  },
                  child: const Text("Add"),
                ),
                const SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: (){
                    Get.to(ListScreen());
                  },
                  child: const Text("List Screen"),
                ),
              ],
            ),
          ),
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

class ListScreen extends StatelessWidget{
  final Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body:  SingleChildScrollView(
        child: ListView.builder(
          itemCount: controller.userList.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
          return GetBuilder<Controller>(
            builder: (context) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Text("Name :- ${controller.userList[index]}"),
              );
            }
          );
        }),
      ),
    );
  }
}