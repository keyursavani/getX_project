import 'dart:math';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomeScreenState();
  }
}

class MyHomeScreenState extends State<HomeScreen>{
  double _scale = 0.5;

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    // final node1 = Node.Id(1);
    Node node1 = Node.Id(1);
    Node node2 = Node.Id(2);
    Node node3 = Node.Id(3);
    Node node4 = Node.Id(4);
    Node node5 = Node.Id(5);
    Node node6 = Node.Id(6);
    Node node7 = Node.Id(7);
    Node node8 = Node.Id(8);
    Node node9 = Node.Id(9);
    Node node10 = Node.Id(10);
    Node node11 = Node.Id(11);
    Node node12 = Node.Id(12);
    Node node13 = Node.Id(13);
    Node node14 = Node.Id(14);
    Node node15 = Node.Id(15);
    Node node16 = Node.Id(16);
    Node node17 = Node.Id(17);
    Node node18 = Node.Id(18);
    Node node19 = Node.Id(19);
    Node node20 = Node.Id(20);
    Node node21 = Node.Id(21);

    // SugiyamaAlgorithm(SugiyamaConfiguration()),
    // graph.addNode(node1);
    // graph.addNode(node2);
    // graph.addNode(node3);
    // graph.addNode(node4);

    // graph.addEdge(node1, node2);
    // graph.addEdge(node3, node4);
    // graph.addEdge(node1, node5);
    // graph.addEdge(node3, node6);
    // graph.addEdge(node5, node6);
    // graph.addEdge(node5, node7);
    // graph.addEdge(node7, node10);
    // graph.addEdge(node7, node9);
    // graph.addEdge(node7, node8);
    // graph.addEdge(node9, node11);
    // graph.addEdge(node9, node12);
    // graph.addEdge(node9, node13);
    // graph.addEdge(node10, node14);
    // graph.addEdge(node10, node15);
    // graph.addEdge(node10, node16);
    // graph.addEdge(node10, node17);
    // graph.addEdge(node14, node18);
    // graph.addEdge(node15, node19);
    // graph.addEdge(node19, node20);
    // graph.addEdge(node19, node21);

    // BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
    graph.addNode(node1);
    graph.addNode(node19);
    graph.addNode(node2);
    // graph.addNode(node20);

    graph.addEdge(node1, node3);
    graph.addEdge(node1, node2);
    graph.addEdge(node2, node19);
    graph.addEdge(node3, node4);
    graph.addEdge(node3, node5);
    graph.addEdge(node3, node6);
    graph.addEdge(node6, node7);
    graph.addEdge(node7, node8);
    graph.addEdge(node7, node9);
    graph.addEdge(node5, node10);
    graph.addEdge(node10, node11);
    graph.addEdge(node10, node12);
    graph.addEdge(node10, node13);
    graph.addEdge(node10, node14);
    graph.addEdge(node11, node15);
    graph.addEdge(node12, node16);
    graph.addEdge(node16, node17);
    graph.addEdge(node16, node18);

    builder
    // ..subtreeSeparation = BuchheimWalkerConfiguration.ORIENTATION_BOTTOM_TOP
    //   ..siblingSeparation = BuchheimWalkerConfiguration.ORIENTATION_BOTTOM_TOP
      // ..levelSeparation = 5
      ..siblingSeparation = (60)
      ..levelSeparation = (60)
      ..subtreeSeparation = (10)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _scale *= 1.5;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _scale /= 1.5;
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
            Expanded(
              child: InteractiveViewer(
                  transformationController: TransformationController()..value = Matrix4.diagonal3Values(_scale, _scale, 1),
                  constrained: false,
                  // boundaryMargin: const EdgeInsets.all(100),
                  minScale: 0.01,
                  maxScale: 5.6,
                  child: Container(
                    padding: const EdgeInsets.only(right: 50, bottom: 50),
                    child: GraphView(
                      graph: graph,
                      animated: true,
                      // algorithm: SugiyamaAlgorithm(SugiyamaConfiguration()),
                      algorithm: BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                      // algorithm: FruchtermanReingoldAlgorithm(),
                      paint: Paint()
                        ..color = Colors.black
                        ..strokeWidth = 1
                        ..style = PaintingStyle.stroke,
                      builder: (Node node) {
                        final nodeKey = node.key!.value as int?;
                        final nodeObject = Node.Id(nodeKey!);

                        return rectangleWidget(nodeObject);
                      },

                    ),
                  )),
            ),
          ],
        ));
  }

  Widget rectangleWidget(Node node) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () {
          // final newNode = Node.Id(graph.nodeCount() + 1);
          // graph.addEdge(node, newNode);
          // setState(() {});
        },
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(color: Colors.blue[100]!, spreadRadius: 1),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${node.key!.value}'),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      final newNode = Node.Id(graph.nodeCount() + 1);
                      graph.addEdge(node, newNode);
                      setState(() {});
                    },
                    child: const Text('+'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              padding: const EdgeInsets.symmetric(vertical:5,horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(width: 1,color: Colors.black)
              ),
              child: Center(
                child: Wrap(
                  children: [
                    Text('${node.key!.value}'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}