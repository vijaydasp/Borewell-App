// import 'package:borwell_app/APIs/buttons_api.dart';
// import 'package:borwell_app/ipaddress_page.dart';
// import 'package:borwell_app/readings_page.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class Mapview extends StatefulWidget {
//   const Mapview({super.key});

//   @override
//   State<Mapview> createState() => _MapviewState();
// }

// class _MapviewState extends State<Mapview> {
//   WebViewController controller = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..setBackgroundColor(const Color(0x00000000))
//     ..setNavigationDelegate(
//       NavigationDelegate(
//         onProgress: (int progress) {},
//         onPageStarted: (String url) {},
//         onPageFinished: (String url) {},
//         onWebResourceError: (WebResourceError error) {},
//         onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith('https://www.youtube.com/')) {
//             return NavigationDecision.prevent;
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     )
//     ..loadRequest(Uri.parse(baseUrl));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ESP32 Cam',
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.blueAccent,
//         centerTitle: true,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             height: 300,
//             margin: const EdgeInsets.all(10.0),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 3,
//                   blurRadius: 5,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: RotatedBox(
//                 quarterTurns: 2,
//                 child: WebViewWidget(controller: controller),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20.0),
//           Expanded(
//             child: Column(
//               children: [
//                 buildControlButton('Up', 'A'),
//                 buildControlButton('Down', 'B'),
//                 buildControlButton('Pick', 'D'),
//                 buildControlButton('Place', 'E'),
//                 const SizedBox(height: 20.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const ReadingsPage()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: const Size(200, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     backgroundColor: Colors.green,
//                   ),
//                   child: const Text(
//                     'Readings',
//                     style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildControlButton(String label, String command) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: ElevatedButton(
//         onPressed: () {
//           connectingapi(command);
//         },
//         style: ElevatedButton.styleFrom(
//           fixedSize: const Size(200, 50),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           backgroundColor: const Color.fromARGB(255, 24, 142, 215),
//         ),
//         child: Text(
//           label,
//           style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
