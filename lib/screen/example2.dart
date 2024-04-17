// import 'package:flutter/material.dart';
// import 'package:progression_tree_map/progression_tree_map.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ProgressionTreeHome(),
//     );
//   }
// }
//
// class ProgressionTreeHome extends StatefulWidget {
//   const ProgressionTreeHome({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return ProgressionTreeHomeState();
//   }
// }
// class ProgressionTreeHomeState extends State<ProgressionTreeHome>{
//   double _scale = 0.5;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Progression TreeMap Demo",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     _scale *= 1.5;
//                   });
//                 },
//                 icon: const Icon(Icons.add),
//               ),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     _scale /= 1.5;
//                   });
//                 },
//                 icon: const Icon(Icons.remove),
//               ),
//             ],
//           ),
//           Expanded(
//             child: InteractiveViewer(
//               transformationController: TransformationController()..value = Matrix4.diagonal3Values(_scale, _scale, 1),
//               constrained: false,
//               // boundaryMargin: const EdgeInsets.all(100),
//               minScale: 0.01,
//               maxScale: 5.6,
//               child: Column(
//                 children: <Widget>[
//                   ..._titleAndMapWidgets(
//                       title: "Colored Nodes & Icons",
//                       map: ProgressionTreeMap(
//                         treeNodes: _tNodeColoredNodesAndIcons,
//                         circleBoundaryPaintingStyle: PaintingStyle.fill,
//                         circleBoundaryColor: Colors.white10,
//                         nodePlacement: NodesPlacement.border,
//                         nodeSeparationAngleFac:2,
//                         globalNodeSize: 60,
//                         centerNodeSize: 60,
//                         linesStartFromOrigin: true,
//                         spacingFactor:1.5,
//                         linesStrokeWidth: 1,
//                         linesStrokeColor: Colors.cyanAccent,
//                         nodeDecoration: const BoxDecoration(
//                             shape: BoxShape.circle, color: Colors.cyanAccent),
//                       )),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Map<TreeNode?, List<TreeNode>> get _tNodeColoredNodesAndIcons => {
//     const TreeNode(
//         child: Text("1"))
//         : [
//       const TreeNode(
//           child: Text("2"),
//           nodes: [
//             TreeNode(
//               child: Text("54"),
//             ),
//             TreeNode(
//               child: Text("4"),
//             ),
//           ]),
//       const TreeNode(child: Text("4"), nodes: [
//         TreeNode(
//           child: Text("3"),
//         ),
//       ]),
//       const TreeNode(child: Text("6"), nodes: [
//         TreeNode(child:Text("9"), nodes: [
//           TreeNode(
//             size: 32,
//             child:Text("8"),
//           )
//         ])
//       ])
//     ]
//   };
//
//   List<Widget> _titleAndMapWidgets(
//       {required String title, required Widget map}) =>
//       [
//         SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: map,
//         ),
//       ];
// }

import 'package:directed_graph/directed_graph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_tree/skill_tree.dart';
// To run this program navigate to
// the folder 'directed_graph/example'
// in your terminal and type:
//
// # dart bin/directed_graph_example.dart
//
// followed by enter.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SkillTree<void, void, String>.layered(
          delegate: LayeredTreeDelegate(
            mainAxisSpacing: 32.0,
            crossAxisSpacing: 48.0,
          ),
          graph: LayeredGraph(
            layout: [
              ['0', '1', '2', null],
              ['3', '4', '5', null],
              ['6', '7', '8', null],
              [null, '9', '10', null],
              ['11', '12', null, '13'],
              [null, null, '14', null],
              [null, '15', '16', null],
            ],
            edges: [
              Edge(from: '7', to: '9', data: null),
              Edge(from: '10', to: '14', data: null),
              Edge(from: '12', to: '15', data: null),
            ],
            nodes: [
              Node(id: '0', data: null),
              Node(id: '1', data: null),
              Node(id: '2', data: null),
              Node(id: '3', data: null),
              Node(id: '4', data: null),
              Node(id: '5', data: null),
              Node(id: '6', data: null),
              Node(id: '7', data: null),
              Node(id: '8', data: null),
              Node(id: '9', data: null),
              Node(id: '10', data: null),
              Node(id: '11', data: null),
              Node(id: '12', data: null),
              Node(id: '13', data: null),
              Node(id: '14', data: null),
              Node(id: '15', data: null),
              Node(id: '16', data: null),
            ],
          ),
        ),
      ),
    );
  }
}
