// import 'package:flutter/material.dart';
// import 'package:flutter_template/utils/app_colors.dart';
//
//
// void main() => runApp(const PositionedTransitionExampleApp());
//
// class PositionedTransitionExampleApp extends StatelessWidget {
//   const PositionedTransitionExampleApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: PositionedTransitionExample(),
//     );
//   }
// }
//
// class PositionedTransitionExample extends StatefulWidget {
//   const PositionedTransitionExample({super.key});
//
//   @override
//   State<PositionedTransitionExample> createState() =>
//       _PositionedTransitionExampleState();
// }
//
//
// class _PositionedTransitionExampleState
//     extends State<PositionedTransitionExample> with TickerProviderStateMixin {
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 2),
//     animationBehavior: AnimationBehavior.normal,
//     vsync: this,
//   )..repeat(reverse: true);
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const double smallLogo = 100;
//     const double bigLogo = 100;
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               SizedBox(height: 200,),
//               Center(
//                 child: Container(
//                   height: 200,
//                   width: MediaQuery.of(context).size.width,
//                   child: Stack(
//                     children: [
//                       Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width,
//                        decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white54),
//                           borderRadius: BorderRadius.all(Radius.circular(15)),
//                           color: Colors.black54,
//                         ),
//                         child: Text("Next", style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white54
//                         ),),
//                       ),
//                       PositionedTransition(
//                         rect: RelativeRectTween(
//                           begin: RelativeRect.fromSize(
//                             const Rect.fromLTWH(0, 0, smallLogo, smallLogo),
//                             Size(200,200),
//                           ),
//                           end: RelativeRect.fromSize(
//                             Rect.fromLTWH(300,
//                                 300, 50,50),
//                             Size(200,200),
//                           ),
//                         ).animate(CurvedAnimation(
//                           parent: _controller,
//                           curve: Curves.linear,
//                         )),
//                         child: const Padding(
//                           padding: EdgeInsets.all(20),
//                           child: FlutterLogo(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//       LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         final Size biggest = constraints.biggest;
//         return Stack(
//           children: <Widget>[
//             PositionedTransition(
//               rect: RelativeRectTween(
//                 begin: RelativeRect.fromSize(
//                   const Rect.fromLTWH(0, 0, smallLogo, smallLogo),
//                   biggest,
//                 ),
//                 end: RelativeRect.fromSize(
//                   Rect.fromLTWH(biggest.width - bigLogo,
//                       biggest.height - bigLogo, bigLogo, bigLogo),
//                   biggest,
//                 ),
//               ).animate(CurvedAnimation(
//                 parent: _controller,
//                 curve: Curves.linear,
//               )),
//               child: const Padding(
//                 padding: EdgeInsets.all(8),
//                 child: FlutterLogo(),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

/// Example 2
//
// import 'package:flutter/material.dart';
//
// /// Flutter code sample for [AnimatedAlign].
//
// void main() => runApp(const AnimatedAlignExampleApp());
//
// class AnimatedAlignExampleApp extends StatelessWidget {
//   const AnimatedAlignExampleApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('AnimatedAlign Sample')),
//         body: const AnimatedAlignExample(),
//       ),
//     );
//   }
// }
//
// class AnimatedAlignExample extends StatefulWidget {
//   const AnimatedAlignExample({super.key});
//
//   @override
//   State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
// }
//
// class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
//   bool selected = false;
//
//   @override
//   void initState(){
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selected = !selected;
//         });
//       },
//       child: Center(
//         child: Container(
//           width: 250.0,
//           height: 250.0,
//           color: Colors.black12,
//           child: AnimatedAlign(
//             alignment: selected ? Alignment.topLeft : Alignment.bottomRight,
//             duration: const Duration(seconds: 1),
//             curve: Curves.fastOutSlowIn,
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.2,
//               width: MediaQuery.of(context).size.width * 0.2,
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.green,
//               ),
//             )
//           ),
//         ),
//       ),
//     );
//   }
// }

/// Example 3 shimmer

/// Simmer example one
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'GeeksForGeeks',
//       routes: {
//         'loading': (_) => LoadingListPage(),
//       },
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shimmer'),
//         backgroundColor: Colors.green,
//       ),
//       body: Column(
//         children: [
//           ListTile(
//             title: const Text('Loading List'),
//             onTap: () => Navigator.of(context).pushNamed('loading'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class LoadingListPage extends StatefulWidget {
//   @override
//   _LoadingListPageState createState() => _LoadingListPageState();
// }
//
// class _LoadingListPageState extends State<LoadingListPage> {
//   bool _enabled = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Loading List'),
//       ),
//       body: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             Stack(
//               children: [
//                 Shimmer.fromColors(
//                   period: Duration(seconds: 5),
//                   baseColor: Colors.black,
//                   highlightColor: Color(0xFF3D3D3D),
//                   // baseColor: Colors.red,
//                   // highlightColor: Colors.green,
//                   enabled: _enabled,
//                   child: Container(
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     color: Colors.black,
//                     child: Text("Next",style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white
//                     ),),
//                   ),
//                   // ListView.builder(
//                   //   itemBuilder: (_, __) => Padding(
//                   //     padding: const EdgeInsets.only(bottom: 8.0),
//                   //     child: Row(
//                   //       crossAxisAlignment: CrossAxisAlignment.start,
//                   //       children: [
//                   //         Container(
//                   //           width: 48.0,
//                   //           height: 48.0,
//                   //           color: Colors.white,
//                   //         ),
//                   //         const Padding(
//                   //           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                   //         ),
//                   //         Expanded(
//                   //           child: Column(
//                   //             crossAxisAlignment: CrossAxisAlignment.start,
//                   //             children: <Widget>[
//                   //               Container(
//                   //                 width: double.infinity,
//                   //                 height: 8.0,
//                   //                 color: Colors.white,
//                   //               ),
//                   //               const Padding(
//                   //                 padding: EdgeInsets.symmetric(vertical: 2.0),
//                   //               ),
//                   //               Container(
//                   //                 width: double.infinity,
//                   //                 height: 8.0,
//                   //                 color: Colors.white,
//                   //               ),
//                   //               const Padding(
//                   //                 padding: EdgeInsets.symmetric(vertical: 2.0),
//                   //               ),
//                   //               Container(
//                   //                 width: 40.0,
//                   //                 height: 8.0,
//                   //                 color: Colors.white,
//                   //               ),
//                   //             ],
//                   //           ),
//                   //         )
//                   //       ],
//                   //     ),
//                   //   ),
//                   //   itemCount: 6,
//                   // ),
//                 ),
//                 Container(
//                   height: 50,
//                   width: MediaQuery.of(context).size.width,
//                   color: Colors.black12,
//                   child: Text("Next...",style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white
//                   ),),
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       _enabled = !_enabled;
//                     });
//                   },
//                   child: Text(
//                     _enabled ? 'Stop' : 'Play',
//                     style: Theme.of(context).textTheme.button?.copyWith(
//                         fontSize: 18.0,
//                         color: _enabled ? Colors.redAccent : Colors.green),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

/// Example 4

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ExampleUiLoadingAnimation(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

const _shimmerGradient = LinearGradient(
  colors: [
    Colors.transparent,
    Color(0xFF3D3D3D),
    Colors.transparent,
  ],
  stops: [
    0.37,
    0.39,
    0.4,
  ],
  begin: Alignment(-0.3,-9),
  end: Alignment(1.0,1.5),
  tileMode: TileMode.clamp,
);

class ExampleUiLoadingAnimation extends StatefulWidget {
  const ExampleUiLoadingAnimation({
    super.key,
  });

  @override
  State<ExampleUiLoadingAnimation> createState() => _ExampleUiLoadingAnimationState();
}

class _ExampleUiLoadingAnimationState extends State<ExampleUiLoadingAnimation> {
  final bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        child: Shimmer(
          linearGradient: _shimmerGradient,
          child: Center(
            child: Column(
              children: [
                ShimmerLoading(
                  isLoading: _isLoading,
                  child: const CircleListItem(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Widget _buildTopRowList() {
//   return SizedBox(
//     child: Container(
//       child:  _buildTopRowItem(),
//     ),
//   );
// }

//   Widget _buildTopRowItem() {
//     return    ShimmerLoading(
//       isLoading: _isLoading,
//       child: const CircleListItem(),
//     );
//   }
}

class Shimmer extends StatefulWidget {
  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  const Shimmer({
    super.key,
    required this.linearGradient,
    this.child,
  });

  final LinearGradient linearGradient;
  final Widget? child;

  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)..repeat(min: -0.5, max: 1.5, period: const Duration(seconds: 4));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

// code-excerpt-closing-bracket

  LinearGradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        transform: _SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  bool get isSized => (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  Listenable get shimmerChanges => _shimmerController;

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // update the shimmer painting.
      });
    }
  }

// code-excerpt-closing-bracket

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }
    final shimmer = Shimmer.of(context)!;
    if (!shimmer.isSized) {
      return const SizedBox();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;
    final offsetWithinShimmer = shimmer.getDescendantOffset(
      descendant: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}

//----------- List Items ---------
class CircleListItem extends StatelessWidget {
  const CircleListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: const Center(
          child: Text(
            "Next",
            style: TextStyle(fontSize: 16, color: Colors.white ,fontWeight: FontWeight.w700),
          ),
        ));
  }
}
