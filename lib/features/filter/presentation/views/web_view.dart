import 'dart:io';
import 'dart:convert';
// To decode base64
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import '../../../../core/presentation/widgets/responsive_space.dart';
import '../../../../core/routes/app_navigators.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_styles.dart';

class WebViewWithDownload extends StatefulWidget {
  final String initialUrl;

  const WebViewWithDownload({Key? key, required this.initialUrl}) : super(key: key);

  @override
  _WebViewWithDownloadState createState() => _WebViewWithDownloadState();
}

class _WebViewWithDownloadState extends State<WebViewWithDownload> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // For Android, WebView must be initialized.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  Future<void> _downloadFile(String url) async {
    // Request storage permission
    final status = await Permission.storage.request();
    if (!status.isGranted) return;

    try {
      // Get the file path to save the PDF
      final directory = await getExternalStorageDirectory();
      final filePath = '${directory?.path}/${url.split('/').last}';

      // Download the file
      final response = await http.get(Uri.parse(url));
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      // Notify user of success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloaded to $filePath'),
          backgroundColor: Colors.green,duration: Duration(seconds: 3),),
      );
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download file: $e')),
      );
    }
  }

  Future<void> _downloadBlob(String base64Data, String fileName) async {
    // Request storage permission
    var status = await Permission.storage.request();
    if (status.isDenied) {
      status = await Permission.storage.request();
    }

    try {
      // Get the directory to save the file
      final directory = await getExternalStorageDirectory();
      final filePath = '${directory?.path}/$fileName';

      // Decode the base64 string and write it to a file
      final bytes = base64Decode(base64Data);
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      // Notify user of success
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Downloaded to $filePath'),
            backgroundColor: Colors.green,duration: Duration(seconds: 3),));
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download blob: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AppImages.drawerIcon),
        title: Text(
          'تفاصيل العمليات',
          style: AppTextStyles.textStyle16,
        ),
        backgroundColor: AppColors.secondary,
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {
                goBack();
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )),
          horizontalSpacer(20)
        ],
      ),
      body: WebView(
        initialUrl: widget.initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        javascriptChannels: {
          JavascriptChannel(
            name: 'DownloadBlobChannel',
            onMessageReceived: (JavascriptMessage message) {
              final blobData = jsonDecode(message.message);
              final base64Data = blobData['data'];
              final fileName = blobData['fileName'];
              _downloadBlob(base64Data, fileName);
            },
          ),
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.endsWith('.pdf')) {
            _downloadFile(request.url);
            return NavigationDecision.prevent;
          } else if (request.url.startsWith('blob:')) {
            // Inject JavaScript to handle the blob download
            _controller.runJavascript('''
              fetch("${request.url}").then(response => response.blob()).then(blob => {
                var reader = new FileReader();
                reader.onloadend = function() {
                  var base64data = reader.result.split(',')[1]; // Extract base64
                  var fileName = "${request.url.split('/').last}";
                  DownloadBlobChannel.postMessage(JSON.stringify({data: base64data, fileName: fileName}));
                };
                reader.readAsDataURL(blob);
              });
            ''');
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
