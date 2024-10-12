// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
//
// class WebViewWithDownload extends StatefulWidget {
//   final String initialUrl;
//
//   const WebViewWithDownload({Key? key, required this.initialUrl}) : super(key: key);
//
//   @override
//   _WebViewWithDownloadState createState() => _WebViewWithDownloadState();
// }
//
// class _WebViewWithDownloadState extends State<WebViewWithDownload> {
//   late WebViewController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     // For Android, WebView must be initialized.
//     if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//   }
//
//   Future<void> _downloadFile(String url) async {
//     // Request storage permission
//     final status = await Permission.storage.request();
//     if (!status.isGranted) return;
//
//     try {
//       // Get the file path to save the PDF
//       final directory = await getExternalStorageDirectory();
//       final filePath = '${directory?.path}/${url.split('/').last}';
//
//       // Download the file
//       final response = await http.get(Uri.parse(url));
//       final file = File(filePath);
//       await file.writeAsBytes(response.bodyBytes);
//
//       // Notify user of success
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Downloaded to $filePath')),
//       );
//     } catch (e) {
//       // Handle errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to download file: $e')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('WebView with PDF Download')),
//       body: WebView(
//         initialUrl: widget.initialUrl,
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (controller) {
//           _controller = controller;
//         },
//         navigationDelegate: (NavigationRequest request) {
//           if (request.url.endsWith('.pdf')) {
//             _downloadFile(request.url);
//             return NavigationDecision.prevent;
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     );
//   }
// }