// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class VideoScreen extends StatelessWidget {
//   final String videoUrl; 

//   VideoScreen({required this.videoUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Video Player")),
//       body: WebViewWidget(
//         controller: ,
//         initialUrl: Uri.dataFromString(
//           '''
//           <!DOCTYPE html>
//           <html>
//           <body>
//             <iframe 
//               width="100%" 
//               height="100%" 
//               src="$videoUrl" 
//               frameborder="0" 
//               allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
//               allowfullscreen>
//             </iframe>
//           </body>
//           </html>
//           ''',
//           mimeType: 'text/html',
//         ).toString(),
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }
