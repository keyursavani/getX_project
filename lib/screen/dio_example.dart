import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tree_example/model/country_list_model.dart';
import 'package:tree_example/model/post_list_model.dart';

void main(){
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      home: const DioExample(),
    );
  }
}

class DioExample extends StatefulWidget{
  const DioExample({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DioExampleState();
  }
}

class DioExampleState extends State<DioExample>{
  final dio = Dio();

  @override
  void initState(){
    getApiCall();
    super.initState();
  }
  CountryList countryList = CountryList();
  List<PostList> postList = [];
  void getApiCall() async {
    final response = await dio.get("https://api.publicapis.org/entries");
    if(response.statusCode == 200){
      // var responseData = jsonDecode(response.data);
      countryList = CountryList.fromJson(response.data);
      // countryList = CountryList.fromJson(responseData);
      print(countryList.count);
      print(countryList.entries![0].description);
      print(countryList.entries![1].description);
      print(countryList.entries![2].description);

    }
    final response2 = await dio.get("https://jsonplaceholder.typicode.com/posts");
    if(response2.statusCode == 200){
      // var responseData = jsonDecode(response2.data);
      for(Map i in response2.data){
        postList.clear();
        postList.add(PostList.fromJson(i));
        print(postList[0].title);
        print(postList[1].title);
        print(postList[2].title);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Text("bcjbj"),
        ),
      ),
    );
  }
}